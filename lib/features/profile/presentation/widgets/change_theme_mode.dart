import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_styles.dart';

class ChangeThemeMode extends StatefulWidget {
  const ChangeThemeMode({super.key});

  @override
  State<ChangeThemeMode> createState() => _ChangeThemeModeState();
}

class _ChangeThemeModeState extends State<ChangeThemeMode> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: double.infinity,
          child: ListTile(
            leading: const Icon(
              Icons.mode_night,
              color: Color(0xFF8CB3FF),
            ),
            title: Text(
              'الوضع المظلم',
              style: AppStyles.style24Medium,
            ),
            trailing: Switch(
              value: isOpened,
              onChanged: (value) {
                setState(() {
                  isOpened = !isOpened;
                });
              },
            ),
          ),
        ),
        const Divider(
          color: Color(0xFF8CB3FF),
          height: 1,
          indent: 15,
          endIndent: 15,
        ),
      ],
    );
  }
}
