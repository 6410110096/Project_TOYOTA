import 'package:flutter/material.dart';
import 'package:evcar/component/config/config.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: tAccentColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: tAccentColor,
        ),
      ),
      title: Text(title,
          style: Theme.of(context).textTheme.bodyMedium?.apply(color: tColor)),
      trailing: endIcon
          ? Container(
              width: 20,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 240, 235, 235)
                      .withOpacity(0.1)),
              child: const Icon(LineAwesomeIcons.angle_double_right,
                  size: 18, color: Colors.grey))
          : null,
    );
  }
}
