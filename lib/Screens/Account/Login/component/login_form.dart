import 'package:evcar/Screens/Account/Signup/signup_screen.dart';
import 'package:evcar/Screens/Account/ForgetPassword/forget_password_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:evcar/component/config/config.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //email
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.person_outline_outlined,
                color: Colors.black,
              ),
              labelText: tEmail,
              hintText: tEmail,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: tFormHeight - 20),

          //password
          TextFormField(
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

          //Forget password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                ForgetPasswordScreen.buildShowModelBottomSheet(context);
              },
              child: const Text(tForgetPassword),
            ),
          ),

          const SizedBox(height: tFormHeight - 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent),
              child: Text(
                tLogin.toUpperCase(),
              ),
            ),
          ),

          const SizedBox(height: tFormHeight - 20),

          //Other continue with
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text("Or continue with"),
              ),
              const SizedBox(height: tFormHeight - 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Google
                  IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage(tGoogleLogo),
                      width: 55,
                    ),
                  ),

                  //Facebook
                  IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage(tFacebookLogo),
                      width: 55,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: tFormHeight - 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpScreen();
                      },
                    ),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: tDontHaveAnAccount,
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
    );
  }
}
