import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcl_fam_app/modules/login/bloc/login_bloc.dart';
import 'package:upcl_fam_app/modules/login/screen/login_form.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) => LoginBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //
      home: LoginForm(), // ✅ directly open login screen
    );
  }
}