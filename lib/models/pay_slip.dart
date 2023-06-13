import 'package:cloud_firestore/cloud_firestore.dart';

class PaySlip {
  String? boarderNote;
  Timestamp? boarderPayDate;
  String? boarderType;
  String? boarderUID;
  String? paySlip;

  PaySlip({
    this.boarderNote,
    this.boarderPayDate,
    this.boarderType,
    this.boarderUID,
    this.paySlip,
  });

   PaySlip.fromJson(Map<String, dynamic> json) {
    boarderNote = json["boarderNote"];
    boarderPayDate = json["boarderPayDate"];
    boarderType = json["boarderType"];
    boarderUID = json["boarderUID"];
    paySlip = json["paySlip"];
   }
}
