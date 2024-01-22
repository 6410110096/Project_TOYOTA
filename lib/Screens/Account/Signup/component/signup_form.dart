import 'package:evcar/Screens/Account/Login/login_screen.dart';
import 'package:evcar/authentication/authemtication_repository/models/user_model.dart';
import 'package:evcar/authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:evcar/component/config/config.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username
            TextFormField(
              controller: controller.username,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                  color: Colors.black,
                ),
                labelText: tUserName,
                hintText: tUserName,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            // Email
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            //Tel. Phone
            TextFormField(
              controller: controller.phone,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: Colors.black,
                ),
                labelText: tPhone,
                hintText: tPhone,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            // Password
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint,
                  color: Colors.black,
                ),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // For Email & Password Authentication
                    /*SignUpController.instance.registerUser(
                        controller.email.text.trim(),
                        controller.password.text.trim());*/

                    // For Phone Authentication
                    /*SignUpController.instance
                        .phoneAuthentication(controller.phone.text.trim());
                    Get.to(() => const OTPScreen());*/

                    // Get User and Pass it to Controller
                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      username: controller.username.text.trim(),
                      phone: controller.phone.text.trim(),
                    );
                    SignUpController.instance.createUser(user);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 70, 64)),
                child: Text(
                  tSignup.toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: tAlreadyHaveAnAnccount,
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: const [
                        TextSpan(
                          text: tSignup,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
