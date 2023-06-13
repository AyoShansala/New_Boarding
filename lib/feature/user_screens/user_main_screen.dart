import 'package:bodima/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';

import '../../app/app_router.dart';

class UserMainScreen extends StatefulWidget {
  static const String routeName = '/usermainscreen';

  const UserMainScreen({Key? key}) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainButton(label: "Upload Payment", onPressed: () {}),
            const SizedBox(
              height: 30,
            ),
            MainButton(
                label: "Payment History",
                onPressed: () {
                  Navigator.pushNamed(
                      context, AppRouter.paymentHistoryScreenRoute);
                }),
            const SizedBox(
              height: 30,
            ),
            MainButton(
                label: "Profile",
                onPressed: () {
                  Navigator.pushNamed(
                      context, AppRouter.userProfileScreenRoute);
                })
          ],
        ),
      ),
    );
  }
}
