import 'package:flutter/material.dart';

import 'package:evcar/Screens/Profile/update_profile.dart';
import 'package:evcar/Screens/Profile/profile_menu.dart';
import 'package:evcar/config/config.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';

//Import package
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Material(
                type: MaterialType.transparency,
                child: Row(),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                'Profile',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(image: AssetImage(tProfileImage)),
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
                          child: const Icon(LineAwesomeIcons.alternate_pencil,
                              size: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tProfileHeading,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    tProfileSubHeading,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () =>
                          Get.to(() => const UpdateProfileScreen()),
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
                      onPress: () {}),

                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),

                  ProfileMenuWidget(
                    title: 'Logout',
                    icon: LineAwesomeIcons.alternate_sign_out,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {},
                  ),
                ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
