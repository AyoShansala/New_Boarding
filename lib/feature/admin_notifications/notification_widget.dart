import 'package:flutter/material.dart';

import '../../shared/colors.dart';

// ignore: must_be_immutable
class NotificationWidget extends StatelessWidget {
  late String textTitle;
  late String textBody;
  late String textDate;
  late bool greenDotVisibility;

  NotificationWidget(
      this.textTitle, this.textBody, this.textDate, this.greenDotVisibility, {super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03, vertical: screenHeight * 0.015),
      width: screenWidth,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textTitle,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Visibility(
                visible: greenDotVisibility,
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.greenColor1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            textBody,
            style: const TextStyle(
                color: AppColors.gray1,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            textDate,
            style: const TextStyle(
                color: Color.fromARGB(255, 92, 91, 91),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
