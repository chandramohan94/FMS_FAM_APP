import 'package:flutter/material.dart';
import 'package:upcl_fam_app/core/constants/image_constant.dart';
import 'package:upcl_fam_app/modules/consumerDetails/billhistory.dart';




class consumerbasic extends StatefulWidget {
  const consumerbasic({Key? key}) : super(key: key);
  @override
  State<consumerbasic> createState() => _consumerbasicState();
}

class _consumerbasicState extends State<consumerbasic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumer Details'),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 22),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: InkWell(
                            onTap:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BillHistory(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(bill,
                                width: 30,
                                height: 30,),
                                Text("Bill History")
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(search,
                            width: 30,
                            height: 30,),
                            Text("Consumer Detail")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(payment,
                            width: 30,
                            height: 30,),
                            Text("Payment History")
                          ],
                        ),
                      ),
                    ],
                ),
              ),
            ),
        ],
        

      ),
    );
  }
}
