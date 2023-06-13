import 'dart:async';
import 'package:bodima/app/app_router.dart';
import 'package:bodima/shared/images.dart';
import 'package:flutter/material.dart';

import '../feature/auth/otp_phone_number_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splashscreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () {
        // Navigate to the social screen when the timer is up
        Navigator.pushNamed(context, AppRouter.otpPhoneNumberScreenRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    // final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              splashImage,
              width: screenWidth,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
