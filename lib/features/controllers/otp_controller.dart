import 'package:evcar/features/Screens/main_screen.dart';
import 'package:get/get.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const MainScreen()) : Get.back();
  }
}
