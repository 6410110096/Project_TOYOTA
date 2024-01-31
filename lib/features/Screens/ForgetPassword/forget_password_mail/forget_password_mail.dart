import 'package:evcar/component/background.dart';
import 'package:evcar/features/controllers/forget_controller.dart';
import 'package:evcar/utils/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel, color: Colors.white70),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSpace * 2),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: tForgetPasswordImage,
                  title: tForgetPassword,
                  subTitle: tForgetPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: tFormHeight),
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.email,
                        validator: TValidator.validateEmail,
                        decoration: const InputDecoration(
                          label: Text(tEmail,
                              style: TextStyle(color: Colors.black)),
                          hintText: tEmail,
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () =>
                                  controller.sendPasswordResetEmail(),
                              child: const Text(tSubmit))),
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
