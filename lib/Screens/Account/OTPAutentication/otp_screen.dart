import 'package:evcar/authentication/controllers/otp_cotroller.dart';
import 'package:evcar/component/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var otpController = Get.put(OTPController());
    // ignore: prefer_typing_uninitialized_variables
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80,
              ),
            ),
            Text(tOtpSubTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 40),
            const Text("$tOtpMessage support@coding.com",
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  otp = code;
                  OTPController.instance.verifyOTP(otp);
                }),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  OTPController.instance.verifyOTP(otp);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent),
                child: const Text(tVerify),
              ),
            )
          ],
        ),
      ),
    );
  }
}
