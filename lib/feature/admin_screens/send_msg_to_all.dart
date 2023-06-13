import 'dart:io';
import 'package:bodima/shared/widgets/main_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:intl/intl.dart';
import '../../../shared/colors.dart';

class SendMSGToAll extends StatefulWidget {
  static const String routeName = '/sendmsgtoall';

  const SendMSGToAll({Key? key}) : super(key: key);

  @override
  State<SendMSGToAll> createState() => _PaymentUploadScreenState();
}

class _PaymentUploadScreenState extends State<SendMSGToAll> {
  DateTime selectedDate = DateTime.now();
  String? realDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      var dateOnly = DateFormat("dd/MM/yyyy").format(picked);
      setState(() {
        selectedDate = picked;
      });
      print("This is date : $dateOnly");
    }
  }

  //image picker package
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  //take image from gallery
  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
  }

  //dropdown list......................................................
  // define a list of options for the dropdown
  final List<String> _userType = [
    "Admin",
    "Boarders",
  ];
  // the selected value
  String? _selectedUserType;

  TextEditingController noteController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String paySlipImage = "";
  Future<void> uploadPaySlip() async {
    // String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    fStorage.Reference reference = fStorage.FirebaseStorage.instance
        .ref()
        .child("boarders_pay_slips")
        .child(selectedDate.toString());
    fStorage.UploadTask uploadTask = reference.putFile(
      File(imageXFile!.path),
    );

    fStorage.TaskSnapshot taskSnapshot =
        await uploadTask.whenComplete(() => {});

    await taskSnapshot.ref.getDownloadURL().then((url) {
      paySlipImage = url;
      //update firebase firestore
      saveDataToFirestore();
    });
  }

  Future saveDataToFirestore() async {
    FirebaseFirestore.instance
        .collection("boarding_payments")
        .doc(auth.currentUser!.uid)
        .collection("payed_date")
        .doc(selectedDate.toIso8601String())
        .set({
      "boarderUID": auth.currentUser!.uid,
      "boarderPayDate": selectedDate,
      "boarderType": _selectedUserType,
      "boarderNote": noteController.text,
      "paySlip": paySlipImage,
    }).then((value) {
      Navigator.pop(context);
      //Navigator.pushNamed(context, AppRouter.nicUploadScreenRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send Notification To All members',
          style: TextStyle(
              color: AppColors.htitleColor,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                  controller: noteController,
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                  controller: noteController,
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
              MainButton(
                label: "Send All",
                onPressed: () async {
                  //uploadPaySlip();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
