import 'package:evcar/common_widgets/form/form_header_widget.dart';
import 'package:evcar/component/background.dart';
import 'package:evcar/constants/colors.dart';
import 'package:evcar/constants/image_strings.dart';
import 'package:evcar/constants/sizes.dart';
import 'package:evcar/constants/text_strings.dart';
import 'package:evcar/features/Screens/ForgetPassword/forget_password_mail/forget_password_mail.dart';
import 'package:evcar/features/Screens/Login/login_screen.dart';
import 'package:evcar/features/controllers/forget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.off(const ForgetPasswordMailScreen()),
            icon: const Icon(Icons.cancel, color: Colors.white70),
          ),
        ],
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(tDefaultSpace * 2),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: tForgetPasswordImage,
                  title: tChangeYourPasswordTitle,
                  subTitle: tChangeYourPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: tFormHeight),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.offAll(const LoginScreen()),
                      child: const Text(tDone)),
                ),
                const SizedBox(height: tSpaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => ForgetPasswordController.instance
                          .resendPasswordResetEmail(email),
                      child: const Text(tResendEmail)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
