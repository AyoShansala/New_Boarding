import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import '../../app/app_router.dart';
import '../../shared/widgets/main_button.dart';

class NicUploadScreen extends StatefulWidget {
  static const String routeName = '/nicuploadscreen';
  const NicUploadScreen({Key? key}) : super(key: key);

  @override
  State<NicUploadScreen> createState() => _NicUploadScreenState();
}

class _NicUploadScreenState extends State<NicUploadScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String frontIdImage = "";
  String backIdImage = "";
  String fileName = DateTime.now().microsecondsSinceEpoch.toString();

  Future<void> uploadImage() async {
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    fStorage.Reference reference = fStorage.FirebaseStorage.instance
        .ref()
        .child("boarders_images")
        .child(fileName);
    fStorage.UploadTask uploadTask = reference.putFile(
      File(imageXFile!.path),
    );
    fStorage.UploadTask uploadTask2 = reference.putFile(
      File(imageXFile2!.path),
    );

    fStorage.TaskSnapshot taskSnapshot =
        await uploadTask.whenComplete(() => {});
    fStorage.TaskSnapshot taskSnapshot2 =
        await uploadTask2.whenComplete(() => {});
    await taskSnapshot.ref.getDownloadURL().then((url) {
      frontIdImage = url;
      //update firebase firestore
      FirebaseFirestore.instance
          .collection("boarding_users")
          .doc(auth.currentUser!.uid)
          .update({
        "frontId": frontIdImage,
      });
    });
    await taskSnapshot2.ref.getDownloadURL().then((url) {
      backIdImage = url;
      //update firebase firestore
      FirebaseFirestore.instance
          .collection("boarding_users")
          .doc(auth.currentUser!.uid)
          .update({
        "backId": backIdImage,
      });
    });
  }

  //image picker package
  XFile? imageXFile; //front image
  XFile? imageXFile2; //back image
  final ImagePicker _picker = ImagePicker();

  //take front id image from camera 
  Future<void> getImageFrontId() async {
    imageXFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageXFile;
    });
  }

  //take back id image from camera
  Future<void> getImageBackId() async {
    imageXFile2 = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageXFile2;
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Identity Verification',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Take a Photo of ID Card',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: screenHeight * 0.22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.done,
                          size: 20,
                          color: Colors.green,
                        )),
                        TextSpan(text: ' Government-issued'),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.done,
                          size: 20,
                          color: Colors.green,
                        )),
                        TextSpan(
                            text: ' Original full-size, unedited documents'),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.done,
                          size: 20,
                          color: Colors.green,
                        )),
                        TextSpan(
                            text:
                                ' Place documents against a single-coloured background'),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.done,
                          size: 20,
                          color: Colors.green,
                        )),
                        TextSpan(text: ' Readable, well-lit, coloured images'),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.red,
                        )),
                        TextSpan(text: ' No black and white images'),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.red,
                        )),
                        TextSpan(text: ' No edited or expired documents'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'File size must be between 10 KB and 5120 KB in jpg/jpeg/png format.',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      getImageFrontId();
                    },
                    child: Container(
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
                ),
                const SizedBox(
                  width: 30,
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      getImageBackId();
                    },
                    child: Container(
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
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            MainButton(
                label: 'Continue',
                onPressed: () {
                  uploadImage().then((value) {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                        context, AppRouter.bottomNavigationRoute);
                  });
                }),
          ],
        ),
      ),
    );
  }
}
