import 'package:bodima/feature/admin_screens/individual_boarder_details.dart';
import 'package:bodima/feature/admin_screens/payment_list.dart';
import 'package:bodima/feature/user_screens/boarders_list/boarders_list_card.dart';
import 'package:bodima/models/boarding_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors.dart';

class BodersDetailsScreen extends StatefulWidget {
  static const String routeName = '/boarderdetailsscreen';

  const BodersDetailsScreen({super.key});

  @override
  State<BodersDetailsScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<BodersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          "Boarders Details",
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

                      // return ListTile(
                      //   title: Text(boardingUser.boarderName!),
                      //   subtitle: Text(boardingUser.phone_number!),
                      // );

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => IndividualBoarderDetails(
                                age: boardingUser.boarderAge!,
                                name: boardingUser.boarderName!,
                                phoneNum1: boardingUser.phone_nummber!,
                                phoneNum2: boardingUser.parent_phone_number!,
                                imgUrl1: boardingUser.frontId!,
                                imgUrl2: boardingUser.backId!,
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
