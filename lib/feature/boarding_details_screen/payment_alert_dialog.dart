import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/widgets/main_button.dart';

void showPaymentsAlertDialog2(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // final mediaQueryData = MediaQuery.of(context);
      // final screenWidth = mediaQueryData.size.width;
      // final screenHeight = mediaQueryData.size.height;
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        insetPadding: const EdgeInsets.all(10),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.69,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Payments",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "2nd Floor single Room A/C",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "31/1 Temple road Homaga,a",
                          style:
                              TextStyle(fontSize: 11, color: Color(0xFF454545)),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text("LKR5000 /M",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 220,
                  child: ListView(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("1 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR5000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("2 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+ LKR10000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("3 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR15000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("4 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR20000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("5 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR25000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("6 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR30000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("7 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR35000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("8 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR40000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("9 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR45000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("10 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR50000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("11 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR55000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.radio_button_off,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("12 Month",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("+LKR60000",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text(
                      "Sub Total",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "LKR45000",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF454545),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                MainButton(label: "Continue", onPressed: () {}),
              ],
            ),
          ),
        ),
      );
    },
  );
}













// import 'package:flutter/material.dart';

// import '../common/colors.dart';
// import '../common/custom_eleveted_button.dart';

// class OrderConfirmDialog extends StatelessWidget {
//   const OrderConfirmDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(13.0),
//       ),
//       insetPadding: const EdgeInsets.all(10),
//       content: SizedBox(
//         height: MediaQuery.of(context).size.height * 0.65,
//         width: MediaQuery.of(context).size.width * 0.8,
//         child: Center(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   const Text(
//                     "Payments",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       icon: const Icon(Icons.close))
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         "2nd Floor single Room A/C",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         "31/1 Temple road Homaga,a",
//                         style:
//                             TextStyle(fontSize: 11, color: Color(0xFF454545)),
//                       )
//                     ],
//                   ),
//                   const Spacer(),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: const [
//                       Text("LKR5000 /M",
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold)),
//                       SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Divider(
//                 thickness: 2,
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               // Row(
//               //   children: const [
//               //     Icon(
//               //       Icons.radio_button_checked,
//               //       color: primaryColor,
//               //     ),
//               //     SizedBox(
//               //       width: 10,
//               //     ),
//               //     Text("A/C",
//               //         style:
//               //             TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//               //     Spacer(),
//               //     Text("+ \$30 /M",
//               //         style:
//               //             TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
//               //   ],
//               // ),
//               // const SizedBox(height: 10),
//               SizedBox(
//                 height: 220,
//                 child: ListView(
//                   children: [
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("1 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR5000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("2 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+ LKR10000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("3 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR15000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("4 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR20000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("5 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR25000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("6 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR30000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("7 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR35000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("8 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR40000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("9 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR45000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("10 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR50000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("11 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR55000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: const [
//                         Icon(
//                           Icons.radio_button_off,
//                           color: primaryColor,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text("12 Month",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold)),
//                         Spacer(),
//                         Text("+LKR60000",
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//               const Divider(
//                 thickness: 2,
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 children: const [
//                   Text(
//                     "Sub Total",
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                   Spacer(),
//                   Text(
//                     "LKR45000",
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Color(0xFF454545),
//                         fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               CustomElevetedButton(text: "Notify", onPressed: () {}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
