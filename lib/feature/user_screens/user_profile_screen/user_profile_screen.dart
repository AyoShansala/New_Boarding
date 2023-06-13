import 'package:bodima/shared/widgets/auth_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../shared/images.dart';
import '../../../shared/widgets/main_button.dart';

class UserProfileScreen extends StatefulWidget {
  static const String routeName = '/userprofilescreen';

  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: AppColors.htitleColor,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            backButton,
            height: 24,
            width: 24,
          ),
          onPressed: () {},
        ),
        actions: [
          InkWell(
            onTap: () {
              //logout function
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.logout,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("boarding_users")
                .doc("qkimApLbj6WU4NWwmkZVJrDWdoK2")
                .get(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
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
                            "Name",
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
                        initialValue: snapshot.data['boarderName'],
                        readOnly: true,
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
                            "Age",
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
                        initialValue: snapshot.data['boarderAge'],
                        readOnly: true,
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
                            "Boarder Phone Number",
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
                        initialValue: snapshot.data['phone_nummber'],
                        readOnly: true,
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
                            "Parent Phone Number",
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
                        initialValue: snapshot.data['parent_phone_number'],
                        readOnly: true,
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
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
