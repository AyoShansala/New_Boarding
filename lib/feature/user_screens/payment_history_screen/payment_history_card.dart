import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentHistoryCard extends StatelessWidget {
  final Color indiColor;
  final Color textColor;
  
  final Timestamp payedMonth;
  final String payedAmount;
  const PaymentHistoryCard({
    super.key,
    required this.indiColor,
    required this.payedMonth,
    required this.payedAmount,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = payedMonth.toDate();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    DateFormat('MMMM').format(dateTime),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.circle,
                    color: indiColor,
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(DateFormat('dd/MM/yyyy').format(dateTime)),
                  // Text(payedMonth.year.toString()+"/"+payedMonth.month.toString()+"/"+payedMonth.day.toString(),),
                  // const Spacer(),
                  // Text(
                  //   text,
                  //   style: TextStyle(
                  //       fontSize: 14,
                  //       color: textColor,
                  //       fontWeight: FontWeight.bold),
                  // )
                ],
              ),
              const Divider(),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "Payment",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      payedAmount,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
