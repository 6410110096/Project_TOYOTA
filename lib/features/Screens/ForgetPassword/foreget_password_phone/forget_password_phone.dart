import 'package:flutter/material.dart';
import 'package:evcar/component/background.dart';
import 'package:get/get.dart';
import '../../../../../common_widgets/form/form_header_widget.dart'; // แก้ไขตามโครงสร้างโฟลเดอร์ของคุณ
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel, color: Colors.white70),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSpace * 1.5),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: tForgetPasswordImage,
                  title: tForgetPassword,
                  subTitle: tForgetPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: tFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text(tPhoneNo,
                              style: TextStyle(color: Colors.black)),
                          hintText: tPhoneNo,
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.numbers),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(tNext),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
