import 'package:evcar/Screens/Account/OTPAutentication/otp_screen.dart';
import 'package:evcar/authentication/authemtication_repository/models/user_model.dart';
import 'package:evcar/authentication/authemtication_repository/repository/authentication_repository.dart';
import 'package:evcar/authentication/authemtication_repository/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //Call Function
  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;

    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  //Get phone from user and pass it ot Auth Repository for firebase
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phone);
    Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phone) {
    AuthenticationRepository.instance.phoneAuthtication(phone);
  }
}
