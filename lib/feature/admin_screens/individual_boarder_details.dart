import 'package:flutter/material.dart';
import '../../../shared/colors.dart';

class IndividualBoarderDetails extends StatefulWidget {
  static const String routeName = '/individualboardedetails';

  const IndividualBoarderDetails({
    Key? key,
    required this.name,
    required this.phoneNum1,
    required this.phoneNum2,
    required this.age,
    required this.imgUrl1,
    required this.imgUrl2,
  }) : super(key: key);
  final String name;
  final String phoneNum1;
  final String phoneNum2;
  final String age;
  final String imgUrl1;
  final String imgUrl2;

  @override
  State<IndividualBoarderDetails> createState() => _PaymentUploadScreenState();
}

class _PaymentUploadScreenState extends State<IndividualBoarderDetails> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
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
                      "Name",
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
                  initialValue: widget.name,
                  enabled: false,
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
                  initialValue: widget.age,
                  enabled: false,
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
                  initialValue: widget.phoneNum1,
                  enabled: false,
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
                      "Parent Phone Number 2",
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
                  initialValue: widget.phoneNum2,
                  enabled: false,
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
                      "ID Images",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
