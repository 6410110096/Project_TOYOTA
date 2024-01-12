import 'package:flutter/material.dart';

import 'package:evcar/component/acheck_account.dart';
import 'package:evcar/component/config/config.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.deepOrangeAccent,
            onSaved: (fullName) {},
            decoration: const InputDecoration(
              hintText: "Full Name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person, color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding), // Add spacing between fields
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.deepOrangeAccent,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.email, color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding), // Add spacing between fields
          TextFormField(
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.deepOrangeAccent,
            onSaved: (phoneNumber) {},
            decoration: const InputDecoration(
              hintText: "Phone number",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.phone, color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding), // Add spacing between fields
          TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: Colors.deepOrangeAccent,
            onSaved: (password) {},
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock, color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
            ),
            child: Text("Sign Up".toUpperCase(),
                style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
