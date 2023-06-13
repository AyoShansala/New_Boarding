import 'package:bodima/shared/widgets/auth_text_field.dart';
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
  //all text editing controllers
  TextEditingController addressLineOneController = TextEditingController();
  TextEditingController addressLineTwoController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController hostalOwnerController = TextEditingController();

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
          "Admin Place",
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const SizedBox(
                  height: 8,
                ),
                AuthFormTextField(
                    controller: addressLineOneController,
                    hintLabelText: 'Address Line 1',
                    textInputType: TextInputType.streetAddress,
                    iconData: Icons.location_on_outlined),
                const SizedBox(height: 14),
                const SizedBox(
                  height: 8,
                ),
                AuthFormTextField(
                    controller: addressLineTwoController,
                    hintLabelText: 'Address Line 2',
                    textInputType: TextInputType.streetAddress,
                    iconData: Icons.location_on_outlined),
                const SizedBox(height: 14),
                const SizedBox(height: 14),
                const SizedBox(
                  height: 8,
                ),
                AuthFormTextField(
                    controller: phoneNumberController,
                    hintLabelText: 'Phone Number',
                    textInputType: TextInputType.phone,
                    iconData: Icons.phone_outlined),
                const SizedBox(height: 14),
                const SizedBox(
                  height: 8,
                ),
                AuthFormTextField(
                    controller: hostalOwnerController,
                    hintLabelText: 'Hostel Owner',
                    textInputType: TextInputType.name,
                    iconData: Icons.man_outlined),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Upload Photo",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 5),
                        height: screenHeight * 0.15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 230, 230, 230),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.camera_enhance_rounded,
                              size: 26,
                              color: Colors.grey,
                            ),
                            Text(
                              'Front of Document',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 97, 97, 97)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 20, left: 5),
                        height: screenHeight * 0.15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 230, 230, 230),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.camera_enhance_rounded,
                              size: 26,
                              color: Colors.grey,
                            ),
                            Text(
                              'Front of Document',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 97, 97, 97)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: SizedBox(
                    height: 40,
                    width: screenWidth - 50,
                    child: MainButton(label: "Add Place", onPressed: () {}),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
