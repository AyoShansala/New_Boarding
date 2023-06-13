import 'package:bodima/feature/boarding_details_screen/boarding_card.dart';
import 'package:flutter/material.dart';

import '../../app/app_router.dart';
import '../../shared/colors.dart';
import '../../shared/images.dart';

class BoardingDetailsScreen extends StatefulWidget {
  static const String routeName = '/boardingdetailsscreen';
  const BoardingDetailsScreen({super.key});

  @override
  State<BoardingDetailsScreen> createState() => _BoardingDetailsScreenState();
}

class _BoardingDetailsScreenState extends State<BoardingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          "Bording",
          style: TextStyle(
              color: AppColors.htitleColor,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            backButton,
            height: 24,
            width: 24,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              homeBoardingImage,
              height: screenHeight * 0.32,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "UDine Bording Colombo",
                                style: TextStyle(
                                    color: AppColors.titleColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.location_on_rounded,
                                size: 14,
                                color: Color(0xFF454545),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "1175 Walnut St.Boulder, CO 80302",
                                style: TextStyle(
                                  color: AppColors.titleColor,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(Icons.watch_later_rounded,
                                  size: 14, color: Color(0xFF454545)),
                              const SizedBox(width: 5),
                              const Text("Number of Rooms: ",
                                  style: TextStyle(
                                      color: AppColors.titleColor,
                                      fontSize: 14)),
                              const SizedBox(width: 3),
                              const Text(
                                "7",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRouter.usersListScreenRoute,
                                  );
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.menu,
                                      color: AppColors.primaryColor,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "View All ",
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 14),
                                    ),
                                    SizedBox(width: 4)
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(thickness: 2),
                          const SizedBox(
                            height: 5,
                          ),
                          //Tab bar here
                          SizedBox(
                            height: screenHeight * 0.44,
                            width: double.infinity,
                            child: ListView(
                              children: const [
                                BordingCard(
                                  foodName: "KU Person 1",
                                  location: "31/4 Temple Road Maharagama",
                                  image: userIcon,
                                ),
                                BordingCard(
                                  foodName: "KU Person 2",
                                  location: "31/4 Temple Road Maharagama",
                                  image: userIcon,
                                ),
                                BordingCard(
                                  foodName: "KU Person 3",
                                  location: "31/4 Temple Road Maharagama",
                                  image: userIcon,
                                ),
                                BordingCard(
                                  foodName: "KU Person 4",
                                  location: "31/4 Temple Road Maharagama",
                                  image: userIcon,
                                ),
                                SizedBox(height: 20)
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
