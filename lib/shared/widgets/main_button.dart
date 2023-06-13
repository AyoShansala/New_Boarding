import '../colors.dart';
import '../fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  late String label;
  late VoidCallback onPressed;
  late Color color;

  MainButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.appMainButtonBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: AppFonts.mainButtonText,
        primary: color,
        onPrimary: Colors.white,
        shadowColor: const Color.fromARGB(255, 2, 2, 2),
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        minimumSize: Size(width * 0.85, height * 0.06), //////// HERE
      ),
      child: Text(label),
    );
  }
}
