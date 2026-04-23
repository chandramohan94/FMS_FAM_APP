
import 'package:flutter/material.dart';


class DemoProject extends StatelessWidget {
  const DemoProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("FAM App"),
        ),
        body: Container(
          height: 400,
          width: 500,
          color: Colors.red,
        ),
      ),
    );
  }
}

