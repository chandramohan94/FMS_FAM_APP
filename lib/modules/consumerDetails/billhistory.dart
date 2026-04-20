import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcl_fam_app/modules/consumerDetails/bloc/bill_history_bloc.dart';
import 'package:upcl_fam_app/modules/consumerDetails/bloc/bill_history_event.dart';
import 'package:upcl_fam_app/modules/consumerDetails/bloc/bill_history_state.dart';
import 'package:upcl_fam_app/modules/consumerDetails/model/BillHistoryReqModel.dart';


class BillHistory extends StatelessWidget {
  const BillHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillHistoryBloc(),
      child: const BillHistoryScreen(),
    );
  }
}

class BillHistoryScreen extends StatefulWidget {
  const BillHistoryScreen({super.key});

  @override
  _BillHistoryScreenState createState() => _BillHistoryScreenState();
}

class _BillHistoryScreenState extends State<BillHistoryScreen> {
  TextEditingController accountNo = TextEditingController();
  late int _selectedYearFromDropdown = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Bill History', style: TextStyle(fontWeight: FontWeight.bold)),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: const Color(0xFF0D47A1), // Deep blue from image
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter Section
          Container(
            padding: const EdgeInsets.all(15.0),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropdownExample(),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: YearDropdown(
                        onYearSelected: (year) {
                          setState(() {
                            _selectedYearFromDropdown = year;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: accountNo,
                  decoration: InputDecoration(
                    labelText: "AccountNo/Sc No*",
                    labelStyle: const TextStyle(color: Colors.red, fontSize: 12),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        String acc = accountNo.text;
                        BillHistoryReqModel bilRequest = BillHistoryReqModel(
                          accountNumber: acc,
                          billYear: _selectedYearFromDropdown.toString(),
                        );
                        BlocProvider.of<BillHistoryBloc>(context).add(
                          SearchButtonPressed(billHistoryRequest: bilRequest),
                        );
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),

          // Results List
          Expanded(
            child: BlocBuilder<BillHistoryBloc, BillHistoryState>(
              builder: (context, state) {
                if (state is BillHistoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BillHistorySuccess) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: state.response.billDetails?.length ?? 0,
                    itemBuilder: (context, index) {
                      final bill = state.response.billDetails![index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              // Mocking the month based on bill date string for UI consistency
                              "${bill.billDate.split('-')[1]} ${_selectedYearFromDropdown}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0D47A1)
                              ),
                            ),
                          ),
                          _buildBillCard(bill),
                        ],
                      );
                    },
                  );
                } else if (state is BillHistoryFailure) {
                  return Center(child: Text('Error: ${state.error}'));
                }
                return const Center(child: Text("Search for an account to see history"));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillCard(dynamic bill) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Amount", style: TextStyle(color: Color(0xFF0D47A1), fontWeight: FontWeight.bold)),
                    Text("₹ ${bill.billAmount}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("View Image", style: TextStyle(color: Color(0xFF0D47A1), decoration: TextDecoration.underline)),
                )
              ],
            ),
            const SizedBox(height: 10),
            _buildDataRow("Consumer Name", bill.consumerName.toString()),
            const Divider(),
            _buildDataRow("SC No.", bill.serviceConnectionNumber.toString()),
            _buildDataRow("Bill Basis", "MU"), // Based on design
            _buildDataRow("Bill Units", bill.billUnits.toString()),
            _buildDataRow("Bill Date", bill.billDate.toString()),
            _buildDataRow("Cat Code", "RTS-1"), // Based on design
            _buildDataRow("Previous Reading", "5366.0"), // Replace with actual field if available
            _buildDataRow("Present Reading", "6170.0"), // Replace with actual field if available

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF1F4F9),
                  foregroundColor: const Color(0xFF0D47A1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text("DOWNLOAD BILL", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 13)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
        ],
      ),
    );
  }
}

// Helper Widgets updated for design
class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String _selectedItem = 'Account No';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedItem,
      decoration: const InputDecoration(
        labelText: 'Search By*',
        labelStyle: TextStyle(color: Colors.red, fontSize: 12),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(),
      ),
      items: ['Account No', 'Service No'].map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (val) => setState(() => _selectedItem = val!),
    );
  }
}

class YearDropdown extends StatefulWidget {
  final Function(int) onYearSelected;
  YearDropdown({required this.onYearSelected});
  @override
  _YearDropdownState createState() => _YearDropdownState();
}

class _YearDropdownState extends State<YearDropdown> {
  late int _selectedYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: _selectedYear,
      decoration: const InputDecoration(
        labelText: 'Year*',
        labelStyle: TextStyle(color: Colors.red, fontSize: 12),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(),
      ),
      items: List.generate(5, (i) => DateTime.now().year - i).map((int year) {
        return DropdownMenuItem<int>(value: year, child: Text(year.toString()));
      }).toList(),
      onChanged: (val) {
        setState(() => _selectedYear = val!);
        widget.onYearSelected(val!);
      },
    );
  }
}