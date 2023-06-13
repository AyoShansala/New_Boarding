import 'package:bodima/feature/admin_screens/single_payment.dart';
import 'package:bodima/feature/user_screens/payment_history_screen/payment_history_card.dart';
import 'package:bodima/feature/user_screens/payment_view/payment_view_screen.dart';
import 'package:bodima/models/pay_slip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors.dart';

class ListOfAllpayments extends StatefulWidget {
  static const String routeName = '/listofallpayments';

  ListOfAllpayments({
    super.key,
    required this.userId,
  });
  String? userId;

  @override
  State<ListOfAllpayments> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<ListOfAllpayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          "All Payments",
          style: TextStyle(
            color: AppColors.htitleColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("boarding_payments")
                  .doc(widget.userId)
                  .collection("payed_date")
                  .orderBy('boarderPayDate', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      PaySlip paySlip = PaySlip.fromJson(
                          snapshot.data!.docs[index].data()
                              as Map<String, dynamic>);

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => SinglePaymentScreen(
                                type: paySlip.boarderType,
                                payDate: paySlip.boarderPayDate!,
                                payNote: paySlip.boarderNote!,
                                paySlipUrl: paySlip.paySlip!,
                              ),
                            ),
                          );
                        },
                        child: PaymentHistoryCard(
                          indiColor: Colors.amber,
                          textColor: Colors.amber,
                          payedAmount: paySlip.boarderNote!,
                          payedMonth: paySlip.boarderPayDate!,
                        ),
                      );
                    },
                  );
                } else {
                  print("this is an error");
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
