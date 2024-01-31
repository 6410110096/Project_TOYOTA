import 'package:evcar/features/controllers/forget_controller.dart';
import 'package:evcar/features/controllers/login_controller.dart';
import 'package:evcar/features/controllers/otp_controller.dart';
import 'package:evcar/features/controllers/sigup_controller.dart';
import 'package:evcar/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';
import '../repository/authentication_repository/authentication_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => OTPController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
  }
}
