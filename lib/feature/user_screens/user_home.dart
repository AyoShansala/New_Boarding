import 'package:bodima/feature/admin_notifications/notification_widget.dart';
import 'package:bodima/shared/fonts.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  static const String routeName = '/userhomescreen';

  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Home',
          style: AppFonts.pageHeadingStyle,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            NotificationWidget(
              'Important!!',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              '2023/06/13',
              true,
            ),
          ],
        ),
      ),
    );
  }
}
