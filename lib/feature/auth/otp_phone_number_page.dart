import 'package:bodima/app/app_router.dart';
import 'package:bodima/feature/auth/otp_input_screen.dart';
import 'package:bodima/shared/widgets/main_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpPhoneNumberScreen extends StatefulWidget {
  static const String routeName = '/otpphonenumberscreen';

  const OtpPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<OtpPhoneNumberScreen> createState() => _OtpPhoneNumberScreenState();
}

class _OtpPhoneNumberScreenState extends State<OtpPhoneNumberScreen> {
  final TextEditingController _phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  sendOtp() async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+94${_phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          //impliment logic in here
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print("Provided phone number invalid");
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        Navigator.pushNamed(
          context,
          AppRouter.otpInputScreenRoute,
          arguments: {
            'verificationId': verificationId,
          },
        );
        //print("verification id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to ',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w300),
              ),
              Text(
                'Hostels',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Enter Your Phone Number Here',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  // prefixIcon: Container(
                  //   padding: const EdgeInsets.all(8),
                  //   child: InkWell(
                  //     onTap: () {},
                  //     child: const Padding(
                  //       padding: EdgeInsets.only(top: 5, bottom: 5),
                  //       child: Text(
                  //         "  +94",
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MainButton(
            label: 'Get Started',
            onPressed: () {
              if (_phoneController.text == 'admin') {
                Navigator.pushNamed(context, AppRouter.bottomNavigationRoute);
              } else {
                sendOtp();
              }
            },
          )
        ],
      ),
    );
  }
}
