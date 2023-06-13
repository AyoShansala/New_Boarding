import 'package:bodima/feature/boarding_details_screen/boarding_card.dart';
import 'package:flutter/material.dart';

class UsersListScreen extends StatefulWidget {
  static const String routeName = '/userslistscreen';

  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery Sizes
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Users',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: SizedBox(
          height: screenHeight * 0.75,
          width: double.infinity,
          child: ListView(
            children: const [
              Text(
                'Bording Users List',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              BordingCard(
                  foodName: "KU Person 1",
                  location: "31/4 Temple Road Maharagama",
                  image: "assets/images/icon.png"),
              BordingCard(
                  foodName: "KU Person 2",
                  location: "31/4 Temple Road Maharagama",
                  image: "assets/images/icon.png"),
              BordingCard(
                  foodName: "KU Person 3",
                  location: "31/4 Temple Road Maharagama",
                  image: "assets/images/icon.png"),
              BordingCard(
                  foodName: "KU Person 4",
                  location: "31/4 Temple Road Maharagama",
                  image: "assets/images/icon.png"),
              BordingCard(
                  foodName: "KU Person 1",
                  location: "31/4 Temple Road Maharagama",
                  image: "assets/images/icon.png"),
              BordingCard(
                  foodName: "KU Person 1",
                  location: "31/4 Temple Road Maharagama",
                  image: "assets/images/icon.png"),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
