import 'dart:io';
import 'package:bodima/shared/widgets/main_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:intl/intl.dart';
import '../../../shared/colors.dart';

class ViewPaymentScreen extends StatefulWidget {
  static const String routeName = '/viewpaymentscreen';

  const ViewPaymentScreen({
    Key? key,
    required this.type,
    required this.payDate,
    required this.payNote,
    required this.paySlipUrl,
  }) : super(key: key);
  final String? type;
  final Timestamp? payDate;
  final String? payNote;
  final String? paySlipUrl;
  @override
  State<ViewPaymentScreen> createState() => _PaymentUploadScreenState();
}

class _PaymentUploadScreenState extends State<ViewPaymentScreen> {
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = widget.payDate!.toDate();
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Payment',
          style: TextStyle(
            color: AppColors.htitleColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text(
                  //   "Select Date",
                  //   style: TextStyle(fontSize: 18),
                  // ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(widget.type!),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 223, 223),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(dateTime),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.calendar_month_rounded,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
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
                      "Note",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
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
                  // controller: noteController,
                  readOnly: true,
                  initialValue: widget.payNote,
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

              // Container(
              //   height: 30,
              //   decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 241, 223, 223),
              //     borderRadius: BorderRadius.circular(6),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //     child: Text(
              //       "${selectedDate.year} / ${selectedDate.month} / ${selectedDate.day}",
              //       style: const TextStyle(fontSize: 18),
              //     ),
              //   ),
              // ),
              // RichText(
              //   text: const TextSpan(
              //     text: 'Upload Payment for:',
              //     style: TextStyle(fontSize: 17, color: Colors.black),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: ' September',
              //         style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.black),
              //       )
              //     ],
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                alignment: Alignment.center,
                height: screenHeight * 0.5,
                width: screenWidth - 45,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: const Color.fromARGB(255, 53, 53, 53)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Image.network(
                  widget.paySlipUrl!,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                     if (loadingProgress == null) return child;
                    return const Center(child: Text('Loading...'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
