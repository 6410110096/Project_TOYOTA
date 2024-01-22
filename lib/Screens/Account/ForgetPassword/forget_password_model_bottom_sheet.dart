import 'package:evcar/Screens/Account/ForgetPassword/forget_password_mail.dart';
import 'package:flutter/material.dart';

import '../../../component/config/config.dart';
import 'Forget_Password_Btn.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tForgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            Text(tForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 30),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgetPasswordMailScreen(),
                  ),
                );
              },
              btnIcon: Icons.mail_outline_rounded,
              title: tEmail,
              subTitle: tResetEmail,
            ),
            const SizedBox(height: 20),
            ForgetPasswordBtnWidget(
              onTap: () {},
              title: tPhone,
              subTitle: tResetPhone,
              btnIcon: Icons.mobile_friendly_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
