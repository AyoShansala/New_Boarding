import 'package:flutter/material.dart';

class BoardersListCard extends StatelessWidget {
  final String boarderName;
  final String boarderAge;
  final String boardeContact;

  const BoardersListCard({
    super.key,
    required this.boarderName,
    required this.boarderAge,
    required this.boardeContact,
  });

  @override
  Widget build(BuildContext context) {
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
                    boarderName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                  // const Spacer(),
                  // Icon(
                  //   Icons.circle,
                  //   color: indiColor,
                  // )
                ],
              ),
              Row(
                children: [
                  Text("Age : $boarderAge"),
                  const Spacer(),
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
                      "Contact Number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      boardeContact,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
