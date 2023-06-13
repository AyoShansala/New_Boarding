import 'package:bodima/feature/user_screens/payment_history_screen/payment_history_card.dart';
import 'package:bodima/feature/user_screens/payment_view/payment_view_screen.dart';
import 'package:bodima/models/pay_slip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../app/app_router.dart';
import '../../../shared/colors.dart';

class PaymentHistoryScreen extends StatefulWidget {
  static const String routeName = '/paymenthistoryscreen';

  PaymentHistoryScreen({
    super.key,
    required this.userId,
  });
  String? userId;

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          "Payment History",
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
                  .doc("uVRFo4ADwSN0j3rMwxWCxqMLn3t1")
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
                              builder: (c) => ViewPaymentScreen(
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




//  return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.bgColor,
//         elevation: 0,
//         title: const Text(
//           "Payment History",
//           style: TextStyle(
//             color: AppColors.htitleColor,
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Upcoming Payments",
//                 style: TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//               const SizedBox(height: 10),
//               InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(
//                       context, AppRouter.paymentUploadScreenRoute);
//                 },
//                 child: const PaymentHistoryCard(
//                   indiColor: Colors.amber,
//                   text: "On Going",
//                   textColor: Colors.amber,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Divider(),
//               const SizedBox(height: 10),
//               const Text(
//                 "Completed Payments",
//                 style: TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//               const SizedBox(height: 10),
//               const PaymentHistoryCard(
//                 indiColor: Colors.white,
//                 text: "Completed",
//                 textColor: Color(0xFF89A3FF),
//               ),
//               const SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );