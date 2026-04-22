import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dashboard/dashboard.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) async {

          /// ❌ ERROR
          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }

          /// ✅ SUCCESS
          if (state is LoginSuccess) {
            final response = state.response;

            final prefs = await SharedPreferences.getInstance();

            prefs.setString("empDesigId", response.empDesigId);
            prefs.setString("empUserId", response.empUserId);
            prefs.setString("empFirstName", response.empFirstName);
            prefs.setString("empLastName", response.empLastName);
            prefs.setString("empLogin", response.empLogin);
            prefs.setString("token", response.jwt);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Dashboard(response.empFirstName),
              ),
            );
          }
        },

        child: Stack(
          children: [

            /// 🔹 Background
            SizedBox.expand(
              child: Image.asset(
                "assets/images/bg.png",
                fit: BoxFit.cover,
              ),
            ),

            Container(color: Colors.black.withOpacity(0.3)),

            /// 🔹 UI
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    /// LOGO
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          "lib/images/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    Text(
                      "Field Activity\nManagement",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 60),

                    /// FORM
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [

                                _buildTextField(
                                  controller: _usernameController,
                                  hint: "Username",
                                  icon: Icons.person,
                                ),

                                SizedBox(height: 15),

                                _buildTextField(
                                  controller: _passwordController,
                                  hint: "Password",
                                  icon: Icons.lock,
                                  isPassword: true,
                                ),

                                SizedBox(height: 20),

                                SizedBox(
                                  width: double.infinity,
                                  height: 55,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF3A7BD5),
                                          Color(0xFF2C5364),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: _login, // ✅ only this matters
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    Text(
                      "Version 1.0.0",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            /// 🔹 LOADER
            BlocBuilder<LoginCubit, LoginState>(
              builder: (_, state) {
                if (state is LoginLoading) {
                  return Container(
                    color: Colors.black54,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? _obscurePassword : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(_obscurePassword
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        )
            : null,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// ✅ NEW LOGIN CALL (CUBIT)
  void _login() {
    context.read<LoginCubit>().login(
      _usernameController.text,
      _passwordController.text,
    );
  }
}