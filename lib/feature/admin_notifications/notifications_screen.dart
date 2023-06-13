import 'package:bodima/shared/widgets/main_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/fonts.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notifications';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  //all text editing controllers
  TextEditingController headingController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future saveDataToFirestore() async {
    FirebaseFirestore.instance
        .collection("users _complains_reports")
        .doc()
        .set({
      "heading": headingController.text,
      "message_body": messageController.text,
    }).then((value) {
      // Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: const Text(
          'Report/Complains',
          style: AppFonts.pageHeadingStyle,
        ),
        // actions: [
        //   IconButton(
        //     iconSize: 20,
        //     icon: const Icon(
        //       Icons.send,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       //Navigator.pushNamed(context, AppRouter.sendNotificationsRoute);
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (c) => MessageInputScreen(),
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: screenHeight * 0.010,
                        right: 25,
                        left: 25,
                      ),
                      child: const Text(
                        "Heading",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
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
                    controller: headingController,
                    style: const TextStyle(fontSize: 20),
                    cursorColor: Colors.black,
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: screenHeight * 0.010,
                        right: 25,
                        left: 25,
                      ),
                      child: const Text(
                        "Message",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
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
                    controller: messageController,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 20),
                    cursorColor: Colors.black,
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
                const SizedBox(
                  height: 20,
                ),
                MainButton(
                  label: "Send",
                  onPressed: () async {
                    saveDataToFirestore();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
