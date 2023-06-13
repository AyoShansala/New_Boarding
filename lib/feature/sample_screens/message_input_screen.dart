import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class MessageInputScreen extends StatefulWidget {
  const MessageInputScreen({super.key});

  @override
  State<MessageInputScreen> createState() => _MessageInputScreenState();
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  String? mtoken = '';
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  TextEditingController userName = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
    getToken();
    initInfo();
  }

  initInfo() async {
    var androidinitialize =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    //  var iOSInitialize = IOSInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidinitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse:  (details) async {
        try {} catch (e) {}
      },
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("...............onMessage.................");
      print(
          "onMessage: ${message.notification!.body}/${message.notification!.title}");

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'dbfood',
        'dbfood',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
      );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data['body'],
      );
    });
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      setState(() {
        mtoken = value;
        print("My token is $mtoken");
      });
      saveToken(value!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection("UsersTokens")
        .doc("User2")
        .set({
      'token': token,
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user grant provisional permision');
    } else {
      print('User declined permission');
    }
  }

  void sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAWvLjzuo:APA91bEmCKb9-uxSfiMHyTKDhlnI10YVJLfKXaysJIcdKOgDppdW9eY4eA01qF4Ft9nmcb1vn8L_UA8aqdferHCBqA86uqzgsCyeoQi4ralSLvHBb_iRLfDrhjMCWRVYo06GQgaGrdHU'
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            "notification": <String, dynamic>{
              "title": title,
              "body": body,
              "android_channel_id": "dbfood",
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("error push notification");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: userName,
          ),
          TextFormField(
            controller: title,
          ),
          TextFormField(
            controller: body,
          ),
          GestureDetector(
            onTap: () async {
              String name = userName.text.trim();
              String titleText = title.text;
              String bodyText = body.text;
              if (name != '') {
                DocumentSnapshot snap = await FirebaseFirestore.instance
                    .collection("UsersTokens")
                    .doc(name)
                    .get();
                String token = snap['token'];
                print(token);
                sendPushMessage(token,titleText,bodyText);
              }
            },
            child: Container(
              margin: EdgeInsets.all(20),
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.5),
                    ),
                  ]),
              child: const Center(
                child: Text("send"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
