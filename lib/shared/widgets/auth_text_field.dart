import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthFormTextField extends StatelessWidget {
  AuthFormTextField({
    super.key,
    required this.hintLabelText,
    required this.textInputType,
    required this.iconData,
    required this.controller,
  });
  late String hintLabelText;
  late TextInputType textInputType;
  late IconData iconData;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: TextField(
            controller: controller,
            keyboardType: textInputType,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                hintText: hintLabelText,
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color.fromARGB(255, 88, 88, 88)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey)),
                prefixIcon: Icon(iconData)),
          ),
        ));
  }
}
