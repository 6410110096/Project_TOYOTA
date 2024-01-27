import 'package:evcar/constants/image_strings.dart';
import 'package:evcar/features/Screens/Login/login_screen.dart';
import 'package:evcar/features/Screens/Welcome/welcome_screen.dart';
import 'package:evcar/component/background.dart';
import 'package:evcar/component/responsive.dart';
import 'package:flutter/material.dart';
import 'package:evcar/features/Screens/Profile/widgets/profile_menu.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_strings.dart';
import 'update_profile_screen.dart';

//Import package
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Responsive(
        mobile: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Material(
                    type: MaterialType.transparency,
                    child: Row(),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: tPrimaryColor),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                  image: AssetImage(tWelcomeScreenImage)),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: tPrimaryColor),
                              child: const Icon(
                                  LineAwesomeIcons.alternate_pencil,
                                  size: 20,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        tProfileHeading,
                      ),
                      const Text(
                        tProfileSubHeading,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return UpdateProfileScreen();
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: tPrimaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text(
                            tEditProfile,
                            style: TextStyle(color: tDarkColor),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      //Menu
                      ProfileMenuWidget(
                          title: 'Notifications',
                          icon: LineAwesomeIcons.cog,
                          onPress: () {}),

                      ProfileMenuWidget(
                          title: 'Data',
                          icon: LineAwesomeIcons.cog,
                          onPress: () {}),

                      ProfileMenuWidget(
                          title: 'Help & Support',
                          icon: LineAwesomeIcons.cog,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const WelcomeScreen();
                                },
                              ),
                            );
                          }),

                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10),

                      ProfileMenuWidget(
                        title: 'Logout',
                        icon: LineAwesomeIcons.alternate_sign_out,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () {
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
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
        desktop: const ProfileScreen(),
      ),
    );
  }
}
