import 'package:evcar/common_widgets/buttons/clickable_ricktext_widget.dart';
import 'package:evcar/features/Screens/Login/login_screen.dart';
import 'package:evcar/features/controllers/sigup_controller.dart';
import 'package:evcar/utils/helper/helper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../common_widgets/buttons/primary_button.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Container(
      padding:
          const EdgeInsets.only(top: tFormHeight - 15, bottom: tFormHeight),
      child: Form(
        key: controller.signupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              validator: (value) {
                if (value!.isEmpty) return 'Name cannot be empty';
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(LineAwesomeIcons.user)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              validator: Helper.validateEmail,
              decoration: const InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(LineAwesomeIcons.envelope)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.phoneNo,
              validator: (value) {
                if (value!.isEmpty) return 'Phone number cannot be empty';
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(LineAwesomeIcons.phone)),
            ),
            const SizedBox(height: tFormHeight - 20),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: Helper.validatePassword,
                obscureText: controller.showPassword.value ? false : true,
                decoration: InputDecoration(
                  label: const Text(tPassword),
                  prefixIcon: const Icon(Icons.fingerprint),
                  suffixIcon: IconButton(
                    icon: controller.showPassword.value
                        ? const Icon(LineAwesomeIcons.eye)
                        : const Icon(LineAwesomeIcons.eye_slash),
                    onPressed: () => controller.showPassword.value =
                        !controller.showPassword.value,
                  ),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),
            Obx(
              () => TPrimaryButton(
                isLoading: controller.isLoading.value ? true : false,
                text: tSignup.tr,
                onPressed: controller.isFacebookLoading.value ||
                        controller.isGoogleLoading.value
                    ? () {}
                    : controller.isLoading.value
                        ? () {}
                        : () => controller.createUser(),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ClickableRichTextWidget(
                  text1: tAlreadyHaveAnAccount,
                  text2: tLogin,
                  onPressed: () => Get.off(() => const LoginScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
