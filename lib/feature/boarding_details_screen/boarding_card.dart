import 'package:bodima/feature/boarding_details_screen/payment_alert_dialog.dart';
import 'package:flutter/material.dart';

import '../../app/app_router.dart';
import '../../shared/colors.dart';
import '../users_list_screen/custom_notify_button.dart';

class BordingCard extends StatelessWidget {
  final String foodName;
  final String location;
  final String image;

  const BordingCard(
      {super.key,
      required this.foodName,
      required this.location,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // color: Colors.grey.shade200,
        width: double.infinity,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 75,
              width: 75,
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                showPaymentsAlertDialog2(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: const TextStyle(
                        color: AppColors.htitleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(location,
                      style: const TextStyle(
                          color: AppColors.titleColor, fontSize: 12)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.notificationsRoute);
                  },
                  child: const CustomNotifyButton()),
            )
          ],
        ),
      ),
    );
  }
}
