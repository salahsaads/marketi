import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_styles.dart';

class CheckNotificationsWidget extends StatefulWidget {
  const CheckNotificationsWidget({super.key});

  @override
  State<CheckNotificationsWidget> createState() =>
      _CheckNotificationsWidgetState();
}

class _CheckNotificationsWidgetState extends State<CheckNotificationsWidget> {
  bool isOpened = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: double.infinity,
          child: ListTile(
            leading: const Icon(
              Icons.notifications_sharp,
              color: Color(0xFF8CB3FF),
            ),
            title: Text(
              'إشعارات التطبيق',
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
