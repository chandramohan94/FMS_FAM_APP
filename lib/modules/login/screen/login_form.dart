import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcl_fam_app/modules/dashboard/dashboard.dart';
import 'package:upcl_fam_app/modules/login/bloc/login_bloc.dart';
import 'package:upcl_fam_app/modules/login/bloc/login_event.dart';
import 'package:upcl_fam_app/modules/login/bloc/login_state.dart';
import 'package:upcl_fam_app/modules/login/model/LoginRequest.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {

    /// 🔹 Make status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,

      body: MediaQuery.removePadding(
        context: context,
        removeTop: true, // ✅ removes top space

        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,

          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) async {
              if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (state is LoginSuccess) {
                final response = state.response;

                var prefs = await SharedPreferences.getInstance();
                prefs.setString("empDesigId", response.empDesigId.toString());
                prefs.setString("empUserId", response.empUserId.toString());
                prefs.setString("empDesigName", response.empDesigName.toString());
                prefs.setString("empLastName", response.empLastName.toString());
                prefs.setString("empOfficeName", response.empOfficeName.toString());
                prefs.setString("empId", response.empId.toString());
                prefs.setString("empLogin", response.empLogin.toString());
                prefs.setString("empFirstName", response.empFirstName.toString());
                prefs.setString("appServiceKey", response.appServiceKey.toString());
                prefs.setString("empCode", response.empCode.toString());
                prefs.setString("userCode", response.empCode);
                prefs.setString("empOfficeid", response.empOfficeid);
                prefs.setString("empReportingOfficeId", response.empReportingOfficeId);
                prefs.setString("ucode", response.ucode);
                prefs.setString("cashierCode", response.cashierCode);
                prefs.setString("isCashier", response.isCashier);
                prefs.setString("appUserValue", _usernameController.text);
                prefs.setString("counterName", response.counterName.toString());
                prefs.setString("counterCode", response.counterCode.toString());
                prefs.setString("counterUserId", response.counterUserRelationId.toString());
                prefs.setString("token", response.jwt.toString());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(response.empFirstName),
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

                /// 🔹 Dark overlay
                Container(
                  color: Colors.black.withOpacity(0.3),
                ),

                /// 🔹 UI Content
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        /// 🔹 UPCL Logo (fixed properly)
                        /// 🔹 UPCL Logo (FULL SIZE FIXED)
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12), // 👈 slight radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "lib/images/logo.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        /// 🔹 Title
                        Text(
                          "Field Activity\nManagement",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 60),

                        /// 🔹 Glass Card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.50),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                                child: Column(
                                  children: [

                                    _buildTextField(
                                      controller: _usernameController,
                                      hint: "UserName",
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

                                    /// 🔹 Gradient Button
                                    SizedBox(
                                      width: double.infinity,
                                      height: 55,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF3A7BD5), // soft blue
                                                Color(0xFF2C5364), // teal blue
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            )
                                        ),
                                        child: ElevatedButton(
                                          onPressed: _login,
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

                        /// 🔹 Version
                        Text(
                          "Version No : 1.0.0",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),

                /// 🔹 Loader
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return Container(
                        color: Colors.black.withOpacity(0.4),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 TextField
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
        fillColor: Colors.white.withOpacity(0.9),
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_off
                : Icons.visibility,
          ),
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

  /// 🔹 Login
  void _login() {
    LoginRequest loginRequest = LoginRequest(
      appReleaseId: "FAM32",
      appUserName: _usernameController.text,
      appUserValue: _passwordController.text,
      userimei: "f33d42337a5951ec",
    );

    BlocProvider.of<LoginBloc>(context)
        .add(LoginButtonPressed(loginRequest: loginRequest));
  }
}