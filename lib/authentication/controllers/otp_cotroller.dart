import 'package:evcar/Screens/main_screen.dart';
import 'package:evcar/authentication/authemtication_repository/repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const MainScreen()) : Get.back();
  }
}
