import 'package:evcar/constants/colors.dart';
import 'package:evcar/constants/sizes.dart';
import 'package:evcar/firebase_options.dart';
import 'package:evcar/repository/authentication_repository/authentication_repository.dart';
import 'package:evcar/utils/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:evcar/features/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      title: 'App Demo',
      theme: ThemeData(
          primaryColor: tPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: tPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: tAccentColor,
            iconColor: tPrimaryColor,
            prefixIconColor: tPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: tDefaultSpace, vertical: tDefaultSpace),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const WelcomeScreen(),
    );
  }
}
