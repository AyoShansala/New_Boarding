import 'package:bodima/feature/auth/user_details_form_screen.dart';
import 'package:bodima/shared/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app_router.dart';
import '../../shared/images.dart';
import '../../shared/widgets/main_button.dart';

class OtpInputScreen extends StatefulWidget {
  static const String routeName = '/otpinputscreen';

  const OtpInputScreen({Key? key}) : super(key: key);
  //final String verificationId;
  @override
  State<OtpInputScreen> createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  // verifyOtp() async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //     verificationId: widget.verificationId,
  //     smsCode: otpController.text,
  //   );
  //   //after sucessfull otp verification push to home page
  //   await auth.signInWithCredential(credential).then((value) => {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const UserDetailsFormScreen(),
  //           ),
  //         ),
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    var args = arguments['verificationId'];
    //final args = arguments['verificationId'];

    verifyOtp() async {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: args,
        smsCode: otpController.text,
      );
      //after sucessfull otp verification push to home page
      User? currentUser;

      await auth.signInWithCredential(credential).then(
            (value) => {
              //save locally

              Navigator.pushNamed(
                context,
                AppRouter.userDetailsFormScreenRoute,
              )
            },
          );
      print("This is uuid : ${auth.currentUser!.uid}");
     ;
      await sharedPreferences!.setString("uid", auth.currentUser!.uid);
    }

    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            otpIcon,
            fit: BoxFit.cover,
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Enter Your OTP Here',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text('We have sent you a OTP to your Phone Number'),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: TextField(
                controller: otpController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18),
                  ),
                )),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       height: 60,
            //       width: 60,
            //       decoration: BoxDecoration(
            //           borderRadius: const BorderRadius.all(Radius.circular(12)),
            //           border: Border.all(color: Colors.black54, width: 1)),
            //     ),
            //     Container(
            //       height: 60,
            //       width: 60,
            //       decoration: BoxDecoration(
            //           borderRadius: const BorderRadius.all(Radius.circular(12)),
            //           border: Border.all(color: Colors.black54, width: 1)),
            //     ),
            //     Container(
            //       height: 60,
            //       width: 60,
            //       decoration: BoxDecoration(
            //           borderRadius: const BorderRadius.all(Radius.circular(12)),
            //           border: Border.all(color: Colors.black54, width: 1)),
            //     ),
            //     Container(
            //       height: 60,
            //       width: 60,
            //       decoration: BoxDecoration(
            //           borderRadius: const BorderRadius.all(Radius.circular(12)),
            //           border: Border.all(color: Colors.black54, width: 1)),
            //     ),
            //   ],
            // ),
          ),
          const SizedBox(
            height: 40,
          ),
          MainButton(
              label: 'Continue',
              onPressed: () {
                // Navigator.pushNamed(
                //     context, AppRouter.userDetailsFormScreenRoute);
                verifyOtp();
              })
        ],
      ),
    );
  }
}
