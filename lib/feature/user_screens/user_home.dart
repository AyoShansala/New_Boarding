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
      title: const Text('User Home', style: AppFonts.pageHeadingStyle,),
      backgroundColor: Colors.white,
      centerTitle: true,
     ),
     body: const Center(
      child: Column(
        
      ),
     ),
    );
  }
}
