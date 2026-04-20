import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcl_fam_app/modules/consumerDetails/screen/consumerbasic.dart';



class Dashboard extends StatefulWidget {
  final String name;
  Dashboard(this.name, {super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String offName = "";
  String desgName = "";

  @override
  void initState() {
    super.initState();
    _getValue();
  }

  Future<void> _getValue() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      offName = prefs.getString("empOfficeName") ?? "DIR_OPERATIONS";
      desgName = prefs.getString("empDesigName") ?? "EE-DIST";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E5398),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: Icon(Icons.flash_on, color: Colors.blue, size: 20),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'UPCL - Uttarakhand Power\nCorporation Ltd.',
                style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.account_circle, color: Colors.white, size: 28),
                Text(widget.name.toUpperCase(), style: const TextStyle(fontSize: 9, color: Colors.white)),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text("Welcome ${widget.name.toUpperCase()}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),

            _buildEmployeeInfoCard(),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildCategoryGroup("Metering", [
                        _buildMenuContent("Metering", Icons.access_time_outlined, Colors.orange),
                      ]),
                      _buildCategoryGroup("NSC", [
                        _buildMenuContent("NSC", Icons.receipt_long_outlined, Colors.red),
                        // const SizedBox(height: 15), // Spacer inside the card
                        // _buildMenuContent("Partial Payment", Icons.credit_card_outlined, Colors.green),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      _buildCategoryGroup("DND", [
                        _buildMenuContent("PD Estimation", Icons.access_time_outlined, Colors.orange),
                      ]),
                      _buildCategoryGroup("COLLECTION", [
                        _buildMenuContent("Receipt", Icons.receipt_long_outlined, Colors.red),
                        // const SizedBox(height: 15), // Spacer inside the card
                        // _buildMenuContent("Partial Payment", Icons.credit_card_outlined, Colors.green),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      _buildCategoryGroup("BILLING", [
                        _buildMenuContent("Billing Approval", Icons.assignment_turned_in_outlined, Colors.blue),
                        // const SizedBox(height: 15), // Spacer inside the card
                        // _buildMenuContent("Update Mobile\nNumber", Icons.location_on_outlined, Colors.red),
                      ]),
                      _buildCategoryGroup("CSC", [
                        _buildMenuContent("Dashboard", Icons.speed_outlined, Colors.green),
                      ]),
                    ],
                  ),
                ),
              ],
            ),

            _buildSearchBox(),
            _buildSyncFooter(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeInfoCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD9E9F7),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("EMPLOYEE INFO", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
          const SizedBox(height: 10),
          _infoText("OFFICE:", offName),
          const SizedBox(height: 5),
          _infoText("DESIGNATION:", desgName),
        ],
      ),
    );
  }

  Widget _infoText(String label, String value) {
    return Row(
      children: [
        SizedBox(width: 110, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87))),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
      ],
    );
  }

  Widget _buildCategoryGroup(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 6, top: 10),
          child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 13)),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.blue.shade50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuContent(String title, IconData icon, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 34, color: color),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildSearchBox() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.shade50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SEARCH", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 12)),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Consumer Detail",
                    hintStyle: const TextStyle(fontSize: 14),
                    filled: true,
                    fillColor: const Color(0xFFF0F5FA),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  // NAVIGATION ADDED HERE
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const consumerbasic())
                  );
                  print("Navigating to Summary.dart");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E5398),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                child: const Text("Search Detail", style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSyncFooter() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9E9F7),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("SYNC MASTER DATA", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 12)),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _syncIcon("Manufacturer Data"),
              _syncIcon("Meter Type Data"),
              _syncIcon("Meter Capacity Data"),
              _syncIcon("Meter Voltage Data"),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E5398),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text("Sync", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _syncIcon(String label) {
    return Column(
      children: [
        const Icon(Icons.check_circle_outline, color: Colors.green, size: 38),
        const SizedBox(height: 8),
        SizedBox(
            width: 65,
            child: Text(label, textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 8.5, fontWeight: FontWeight.bold, color: Colors.black87)
            )
        ),
      ],
    );
  }
}