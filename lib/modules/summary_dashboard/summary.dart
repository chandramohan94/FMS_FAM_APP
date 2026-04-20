import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdcd3d0), // light grey background (outer)
      appBar: AppBar(
        backgroundColor: const Color(0xff0a4da2), // Blue header
        elevation: 0,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // 1️⃣ Collection Summary
              dashboardItem(
                img: "assets/icons/collection.png",
                title: "Collection Summary",
              ),
              const SizedBox(height: 40),

              // 2️⃣ Billing Summary
              dashboardItem(
                img: "assets/icons/billing.png",
                title: "Billing Summary",
              ),
              const SizedBox(height: 40),

              // 3️⃣ Metering Summary
              dashboardItem(
                img: "assets/icons/metering.png",
                title: "Metering Summary",
              ),
              const SizedBox(height: 40),

              // 4️⃣ CSC Summary
              dashboardItem(
                img: "assets/icons/csc.png",
                title: "Csc Summary",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboardItem({required String img, required String title}) {
    return Column(
      children: [
        Image.asset(
          img,
          height: 65,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
