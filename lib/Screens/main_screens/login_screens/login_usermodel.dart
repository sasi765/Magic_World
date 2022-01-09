import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String mobileNumber;
  String adress;
  String email;
  Timestamp timestamp;
  String uid;

  UserModel(
      {this.name,
      this.mobileNumber,
      this.adress,
      this.email,
      this.timestamp,
      this.uid});
  toMap() {
    return {
      "name": name,
      "mobileNumber": mobileNumber,
      "adress": adress,
      "email": email,
      "uid": uid,
      "timestamp": FieldValue.serverTimestamp()
    };
  }

  factory UserModel.fromMap(Map map) {
    return UserModel(
      name: map["name"],
      mobileNumber: map["mobileNumber"],
      adress: map["adress"],
      email: map["email"],
      timestamp: map["timestamp"],
      uid: map["uid"],
    );
  }
}

// class UserModel {
//   String name;
//   String mobileNumber;
//   String adress;
//   String email;
//   Timestamp timestamp;
//   String uid;

//   UserModel(Map map) {
//     mobileNumber = map["mobileNumber"];
//     adress = map["adress"];
//     email = map["email"];
//     timestamp = map["timestamp"];
//     uid = map["uid"];
//     name = map["name"];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "uid": uid,
//       "adress": adress,
//       "email": email,
//       "timestamp": Timestamp.now(),
//       "mobileNumber": mobileNumber,
//       "name": name,
//     };
//   }

//   // UserModel({
//   //    this.name,
//   //    this.uid,
//   //    this.adress,
//   //    this.email,
//   //    this.timestamp,
//   //    this.mobileNumber,
//   // });
// }
