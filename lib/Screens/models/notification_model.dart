import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String name;
  String message;
  String phonenumber;

  NotificationModel(Map map) {
    if (map != null) {
      name = map["Name"];
      message = map["Message"];
      phonenumber = map["Phonenumber"];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Message': message,
      "Phonenumber": phonenumber,
    };
  }
}
