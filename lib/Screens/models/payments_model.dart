import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  String id;
  String name;
  String image;
  String mainCategoryId;
  Timestamp timestamp;
  bool isGeneralCategory;

  PaymentModel(Map map) {
    if (map != null) {
      id = map["id"];
      name = map["name"];
      image = map["image"];
      isGeneralCategory = map["isGeneralCategory"];
      mainCategoryId = map["mainCategoryId"];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      "mainCategoryId": mainCategoryId,
      'timestamp': DateTime.now(),
      "isGeneralCategory": isGeneralCategory
    };
  }
}
