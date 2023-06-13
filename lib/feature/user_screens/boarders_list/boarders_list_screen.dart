import 'package:bodima/feature/user_screens/boarders_list/boarders_list_card.dart';
import 'package:bodima/feature/user_screens/payment_history_screen/payment_history_screen.dart';
import 'package:bodima/models/boarding_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors.dart';

class BoardersListScreen extends StatefulWidget {
  static const String routeName = '/paymenthistoryscreen';

  const BoardersListScreen({super.key});

  @override
  State<BoardersListScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<BoardersListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          "List Of Boarders",
          style: TextStyle(
              color: AppColors.htitleColor,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("boarding_users")
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print("yesss True");
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      // print("Print 1 ${snapshot.data.docs}");
                      BoardingUser boardingUser = BoardingUser.fromJson(
                          snapshot.data!.docs[index].data()
                              as Map<String, dynamic>);

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => PaymentHistoryScreen(
                                userId: boardingUser.boarderUID,
                              ),
                            ),
                          );
                        },
                        child: BoardersListCard(
                          boarderName: boardingUser.boarderName.toString(),
                          boarderAge: boardingUser.boarderAge.toString(),
                          boardeContact: boardingUser.phone_nummber.toString(),
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
