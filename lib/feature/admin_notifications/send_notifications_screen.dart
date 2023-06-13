import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/images.dart';
import '../../shared/widgets/main_button.dart';

class SendNotificationsScreen extends StatefulWidget {
  static const String routeName = '/sendnotifications';
  const SendNotificationsScreen({super.key});

  @override
  State<SendNotificationsScreen> createState() =>
      _SendNotificationsScreenState();
}

class _SendNotificationsScreenState extends State<SendNotificationsScreen> {
  // Declare a variable to store the selected value
  String? selectedValue;

// Create a list of options for the dropdown menu
  final List<DropdownMenuItem<String>> dropdownItems = [
    const DropdownMenuItem(
      value: 'person 1',
      child: Text('person 1'),
    ),
    const DropdownMenuItem(
      value: 'person 2',
      child: Text('person 2'),
    ),
    const DropdownMenuItem(
      value: 'person 3',
      child: Text('person 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        title: const Text(
          "Admin Place",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Topic",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 70,
                  child: TextField(
                      maxLength: 25,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: "Enter Topic",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Colors.black)))),
                ),
                const SizedBox(height: 14),
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 150,
                  child: TextField(
                      maxLength: 100,
                      maxLines: 5,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: "Enter Description",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Colors.black)))),
                ),
                const SizedBox(height: 14),
                const Text(
                  "Person",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: null,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                      hintText: 'Select User',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    items: [
                      'Admin 1',
                      'Admin 2',
                      'Admin 3',
                      'Person 1',
                      'Person 2',
                      'Person 3'
                    ]
                        .map((option) => DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MainButton(label: "Save", onPressed: () {}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
