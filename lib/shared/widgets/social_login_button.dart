import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SocialLoginButton extends StatelessWidget {

   late String buttonText;
   late Color buttonTextColor = Colors.black;
  late String buttonLogo;
  late Color color;
   late VoidCallback onPressed;
   SocialLoginButton({Key? key, required this.buttonText, required this.buttonLogo, required this.color, required this.buttonTextColor, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width*0.2 ),
              child: Image.asset(
                buttonLogo,
                height: 30,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              buttonText,
              style: TextStyle(
                color: buttonTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
    ;
  }
}
