import 'package:cloud_firestore/cloud_firestore.dart';

// class CategoryModel {
//   String id;
//   String name;
//   String image;
//   String mainCategoryId;
//   Timestamp timestamp;
//   bool isGeneralCategory;

//   CategoryModel(Map map) {
//     if (map != null) {
//       id = map["id"];
//       name = map["name"];
//       image = map["image"];
//       isGeneralCategory = map["isGeneralCategory"];
//       mainCategoryId = map["mainCategoryId"];
//     }
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'image': image,
//       "mainCategoryId": mainCategoryId,
//       'timestamp': DateTime.now(),
//       "isGeneralCategory": isGeneralCategory
//     };
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class CategoryModel {
//   String name;
//   String mobileNumber;
//   String adress;
//   String email;
//   Timestamp timestamp;
//   String uid;

//   // CategoryModel(Map map)( {
//   //   id = map["id"];
//   //   name = map["name"];
//   //   image = map["image"];
//   //   isGeneralCategory = map["isGeneralCategory"];
//   //   mainCategoryId = map["mainCategoryId"];
//   // });

//   CategoryModel(Map<String, dynamic> data,
//       {this.uid,
//       this.mobileNumber,
//       this.adress,
//       this.email,
//       this.name,
//       this.timestamp});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': uid,
//       'name': name,
//       'image': adress,
//       "mainCategoryId": mobileNumber,
//       'timestamp': DateTime.now(),
//       "isGeneralCategory": email
//     };
//   }
// }

class UsersModel {
  String uid;
  String adress;
  String email;
  String mobileNumber;
  Timestamp timestamp;
  String name;

  UsersModel(Map map) {
    if (map != null) {
      uid = map["uid"];
      name = map["name"];
      adress = map["adress"];
      email = map["email"];
      mobileNumber = map["mobileNumber"];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'adress': adress,
      "email": email,
      'timestamp': DateTime.now(),
      "mobileNumber": mobileNumber
    };
  }
}
