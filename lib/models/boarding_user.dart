class BoardingUser {
  String? backId;
  String? boarderAge;
  String? boarderEmail;
  String? boarderName;
  String? boarderUID;
  String? frontId;
  String? parent_phone_number;
  String? phone_nummber;

  BoardingUser({
    this.backId,
    this.boarderAge,
    this.boarderEmail,
    this.boarderName,
    this.boarderUID,
    this.frontId,
    this.parent_phone_number,
    this.phone_nummber,
  });

  BoardingUser.fromJson(Map<String, dynamic> json) {
    backId = json["backId"];
    boarderAge = json["boarderAge"];
    boarderEmail = json["boarderEmail"];
    boarderName = json["boarderName"];
    boarderUID = json["boarderUID"];
    frontId = json["frontId"];
    parent_phone_number = json["parent_phone_number"];
    phone_nummber = json["phone_nummber"];
  }
}
