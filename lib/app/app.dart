import 'package:flutter/material.dart';
import 'package:upcl_fam_app/modules/login/presentation/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => LoginForm(),
      },
    );
  }
}