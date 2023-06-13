import 'package:bodima/shared/fonts.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  static const String routeName = '/adminhomescreen';

  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Home',
          style: AppFonts.pageHeadingStyle,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: screenHeight * 0.010,
                  right: 25,
                  left: 25,
                ),
                child: const Text(
                  "Number of boarders",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: screenHeight * 0.025,
              right: 25,
              left: 25,
            ),
            child: Text("16"),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: screenHeight * 0.010,
                  right: 25,
                  left: 25,
                ),
                child: const Text(
                  "Total",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: screenHeight * 0.025,
              right: 25,
              left: 25,
            ),
            child: TextFormField(
              //controller: noteController,
              initialValue: '74,000.00',
              readOnly: true,
              style: const TextStyle(
                fontSize: 20,
              ),
              cursorColor: Colors.black,

              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(color: Colors.black),
                ),
                filled: false,
                contentPadding: EdgeInsets.all(17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
