import 'package:evcar/Screens/Account/Login/login_screen.dart';
import 'package:evcar/Screens/Account/OTPAutentication/otp_screen.dart';
import 'package:evcar/Screens/Account/ForgetPassword/form_header_widget.dart';
import 'package:evcar/component/config/config.dart';
import 'package:flutter/material.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: tDefaultSize * 4),
                const FormHeaderWidget(
                  image: tFacebookLogo,
                  title: tForgetPassword,
                  subTitle: tForgetPasswordVia,
                  heightBetween: 30,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: tFormHeight),
                Form(
                  child: Column(
                    children: [
                      // Email Address
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text(tEmailAddress),
                          hintText: tEmailAddress,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.mail_outline_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const OTPScreen();
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent),
                          child: const Text(tSend),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: tTryAnothorWay,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
