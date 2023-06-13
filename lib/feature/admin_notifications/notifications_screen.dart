import 'package:bodima/feature/sample_screens/message_input_screen.dart';
import 'package:flutter/material.dart';

import '../../app/app_router.dart';
import '../../shared/colors.dart';
import '../../shared/fonts.dart';
import 'notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notifications';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: const Text(
          'Notifications',
          style: AppFonts.pageHeadingStyle,
        ),
        actions: [
          IconButton(
            iconSize: 20,
            icon: const Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () {
              //Navigator.pushNamed(context, AppRouter.sendNotificationsRoute);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (c) => MessageInputScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Column(
            children: [
              NotificationWidget(
                  'Title Here',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  '2002/08/31',
                  true),
              NotificationWidget(
                  'Title',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  '2002/08/31',
                  true),
              NotificationWidget(
                  'Title Here',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  '2002/08/31',
                  false),
            ],
          ),
        ),
      ),
    );
  }
}
