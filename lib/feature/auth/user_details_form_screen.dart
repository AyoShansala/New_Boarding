import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../app/app_router.dart';
import '../../shared/colors.dart';
import '../../shared/widgets/auth_text_field.dart';
import '../../shared/widgets/main_button.dart';

class UserDetailsFormScreen extends StatefulWidget {
  static const String routeName = '/userdetailsformscreen';
  const UserDetailsFormScreen({super.key});

  @override
  State<UserDetailsFormScreen> createState() => _UserDetailsFormScreenState();
}

class _UserDetailsFormScreenState extends State<UserDetailsFormScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  //all text editing controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController parentPhoneNumberController = TextEditingController();

  Future saveDataToFirestore() async {
    FirebaseFirestore.instance.collection("boarding_users").doc(auth.currentUser!.uid).set({
      "boarderUID": auth.currentUser!.uid,
      "boarderEmail": emailController.text.trim(),
      "boarderName": nameController.text.trim(),
      "boarderAge": ageController.text,
      "phone_nummber": phoneNumberController.text.trim(),
      "parent_phone_number": parentPhoneNumberController.text.trim(),
      "frontId":"",
      "backId":"",
    }).then((value) {
       Navigator.pop(context);
       Navigator.pushNamed(context, AppRouter.nicUploadScreenRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Happy to see you on board! \nHeres how to get started.",
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AuthFormTextField(
              controller: nameController,
              hintLabelText: 'Full Name',
              textInputType: TextInputType.name,
              iconData: Icons.person_outline,
            ),
            const SizedBox(
              height: 18,
            ),
            AuthFormTextField(
              controller: emailController,
              hintLabelText: 'Email',
              textInputType: TextInputType.emailAddress,
              iconData: Icons.email_outlined,
            ),
            const SizedBox(
              height: 18,
            ),
            AuthFormTextField(
              controller: ageController,
              hintLabelText: 'Age',
              textInputType: TextInputType.number,
              iconData: Icons.calendar_month_outlined,
            ),
            const SizedBox(
              height: 18,
            ),
            AuthFormTextField(
              controller: phoneNumberController,
              hintLabelText: 'Phone Number',
              textInputType: TextInputType.phone,
              iconData: Icons.phone_outlined,
            ),
            const SizedBox(
              height: 18,
            ),
            AuthFormTextField(
                controller: parentPhoneNumberController,
                hintLabelText: 'Parents Phone Number',
                textInputType: TextInputType.phone,
                iconData: Icons.phone_outlined),
            // SizedBox(
            //   height: 60,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 30),
            //     child: TextField(
            //         keyboardType: TextInputType.phone,
            //         cursorColor: Colors.black,
            //         decoration: InputDecoration(
            //           enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(12),
            //               borderSide: const BorderSide(color: Colors.grey)),
            //           focusedBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(12),
            //               borderSide: const BorderSide(color: Colors.grey)),
            //           prefixIcon: Container(
            //             padding: const EdgeInsets.all(8),
            //             child: InkWell(
            //               onTap: () {
            //                 showCountryPicker(
            //                     context: context,
            //                     countryListTheme: CountryListThemeData(
            //                         bottomSheetHeight: 500,
            //                         borderRadius: BorderRadius.circular(13)),
            //                     onSelect: (value) {
            //                       setState(() {
            //                         selectedCountry = value;
            //                       });
            //                     });
            //               },
            //               child: Padding(
            //                 padding: const EdgeInsets.only(top: 5, bottom: 5),
            //                 child: Row(
            //                   children: [
            //                     const Icon(Icons.public),
            //                     const SizedBox(width: 20),
            //                     Text(
            //                       "${selectedCountry.flagEmoji}  ${selectedCountry.displayNameNoCountryCode}",
            //                       style: const TextStyle(
            //                         fontSize: 16,
            //                         color: Colors.black,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         )),
            //   ),
            // ),
            const SizedBox(
              height: 18,
            ),
            // const CustomTextField(
            //     icon: Icons.confirmation_num_outlined,
            //     hintText: "Promo code/ Optional"),
            // const SizedBox(height: 15),
            RichText(
              text: const TextSpan(
                text: 'By creating an account or signing you \nagree to our',
                style: TextStyle(fontSize: 13, color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Terms and Conditions',
                      style: TextStyle(color: AppColors.primaryColor)),
                ],
              ),
            ),
            const SizedBox(height: 15),
          
            MainButton(
              label: "Sign Up",
              onPressed: () {
                //Navigator.pushNamed(context, AppRouter.nicUploadScreenRoute);
                saveDataToFirestore();
              },
            )
          ],
        ),
      ),
    );
  }
}
