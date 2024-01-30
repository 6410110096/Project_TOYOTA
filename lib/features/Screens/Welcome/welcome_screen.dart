import 'package:evcar/component/background.dart';
import 'package:evcar/component/responsive.dart';
import 'package:evcar/features/Screens/Welcome/component/login_signup_btn.dart';
import 'package:evcar/features/Screens/Welcome/component/welcome_image.dart';
import 'package:evcar/utils/animations/animation_design.dart';
import 'package:evcar/utils/animations/fade_animation_controller.dart';
import 'package:evcar/utils/animations/fade_animation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.animationIn();

    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileWelcomeScreen(),
          desktop: Row(
            children: [
              Expanded(
                child: TFadeInAnimation(
                  isTwoWayAnimation: false,
                  durationInMs: 1200,
                  animate: TAnimatePosition(
                    bottomAfter: 0,
                    bottomBefore: -100,
                    leftBefore: 0,
                    leftAfter: 0,
                    topAfter: 0,
                    topBefore: 0,
                    rightAfter: 0,
                    rightBefore: 0,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 600,
                            child: WelcomeImage(),
                          ),
                          SizedBox(
                            width: 450,
                            child: LoginAndSignupBtn(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TFadeInAnimation(
          isTwoWayAnimation: false,
          durationInMs: 2200,
          animate: TAnimatePosition(
            bottomAfter: 0,
            bottomBefore: -100,
            leftBefore: 0,
            leftAfter: 0,
            topAfter: 0,
            topBefore: 0,
            rightAfter: 0,
            rightBefore: 0,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 420,
                    child: WelcomeImage(),
                  ),
                  SizedBox(
                    width: 375,
                    child: LoginAndSignupBtn(),
                  ),
                ],
              ),
            ],
          ), // Wrap YourChildWidget with TFadeInAnimation
        ),
      ],
    );
  }
}
