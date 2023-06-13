import 'package:flutter/material.dart';

class CustomNotifyButton extends StatelessWidget {
  const CustomNotifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.green),
      height: 30,
      width: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
            size: 20,
          ),
          Text(
            " Notify",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
