import 'dart:io';
import 'package:bodima/app/app_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:bodima/shared/widgets/auth_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../shared/colors.dart';
import '../../../shared/images.dart';
import '../../../shared/widgets/main_button.dart';

class AdminRegisterScreen extends StatefulWidget {
  static const String routeName = '/adminregisterscreen';

  const AdminRegisterScreen({super.key});

  @override
  State<AdminRegisterScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<AdminRegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String boardingImage = "";
  Future<void> uploadBoardingimage() async {
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    fStorage.Reference reference = fStorage.FirebaseStorage.instance
        .ref()
        .child("boarding_owners_images")
        .child(fileName);
    fStorage.UploadTask uploadTask = reference.putFile(
      File(imageXFile!.path),
    );

    fStorage.TaskSnapshot taskSnapshot =
        await uploadTask.whenComplete(() => {});

    await taskSnapshot.ref.getDownloadURL().then((url) {
      boardingImage = url;
      //update firebase firestore
      saveDataToFirestore();
    });
  }

  Future saveDataToFirestore() async {
    FirebaseFirestore.instance
        .collection("boarding_owners")
        .doc(auth.currentUser!.uid)
        .collection("boarding_name")
        .doc(hostalOwnerController.text)
        .set({
      "ownerUID": auth.currentUser!.uid,
      "ownerAdrress_1": addressLineOneController.text,
      "ownerAddress_2": addressLineTwoController.text,
      "ownerPhoneNumber": phoneNumberController.text,
      "ownerName": hostalOwnerController.text,
      "ownerImage": boardingImage,
    }).then((value) {
      Navigator.pop(context);
      Navigator.pushNamed(context, AppRouter.bottomNavigationRoute);
    });
  }

  //all text editing controllers
  TextEditingController addressLineOneController = TextEditingController();
  TextEditingController addressLineTwoController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController hostalOwnerController = TextEditingController();

  //image picker package
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  //take image from gallery
  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        imageXFile;
      },
    );
  }

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
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Image.asset(
        //     backButton,
        //     height: 24,
        //     width: 24,
        //   ),
        //   onPressed: () {},
        // ),
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
                  iconData: Icons.location_on_outlined,
                ),
                const SizedBox(height: 14),
                const SizedBox(
                  height: 8,
                ),
                AuthFormTextField(
                  controller: addressLineTwoController,
                  hintLabelText: 'Address Line 2',
                  textInputType: TextInputType.streetAddress,
                  iconData: Icons.location_on_outlined,
                ),
                const SizedBox(height: 14),
                const SizedBox(
                  height: 8,
                ),
                AuthFormTextField(
                  controller: phoneNumberController,
                  hintLabelText: 'Phone Number',
                  textInputType: TextInputType.phone,
                  iconData: Icons.phone_outlined,
                ),
                const SizedBox(height: 14),
                const SizedBox(
                  height: 8,
                ),
                AuthFormTextField(
                  controller: hostalOwnerController,
                  hintLabelText: 'Hostel Owner',
                  textInputType: TextInputType.name,
                  iconData: Icons.man_outlined,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Upload Photo",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        height: screenHeight * 0.20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 230, 230, 230),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            _getImage();
                          },
                          child: imageXFile == null
                              ? const Icon(
                                  Icons.upload,
                                  size: 30,
                                  color: Colors.grey,
                                )
                              : Image(
                                  image: FileImage(
                                    File(imageXFile!.path),
                                  ),
                                  fit: BoxFit.contain,
                                ),
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
                    child: MainButton(
                      label: "Add Place",
                      onPressed: () async {
                        uploadBoardingimage();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
