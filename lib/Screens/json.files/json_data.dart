import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'image_entity.dart';

class MovieEntity {
  String id;
  String title;
  String typeMovie;
  String text1;
  String text2;
  String text3;
  String text4;
  String image;
  String key;
  int price;

  List<ImageEntity> screenShots;

  MovieEntity(
    this.title,
    this.id,
    this.typeMovie,
    this.image,
    this.screenShots,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.key,
    this.price,
  );
  MovieEntity.fromSnapshotjson(DocumentSnapshot snapshot)
      : id = snapshot.id,
        title = snapshot["Title"],
        typeMovie = snapshot["TypeMovie"],
        text1 = snapshot["text1"],
        text2 = snapshot["text2"],
        text3 = snapshot["text3"],
        image = snapshot["Image"],
        price = snapshot["Price"],
        text4 = snapshot["text4"],
        key = snapshot["Key"],
        screenShots = snapshot["Videos"].map<ImageEntity>((item) {
          return ImageEntity.fromMap(item);
        }).toList();

  static Map<String, dynamic> stringToMap(String s) {
    Map<String, dynamic> map = json.decode(s);
    return map;
  }

  toJson() {
    return {
      "Id": id,
      "Price": price,
      "Title": title,
      "text1": text1,
      "text2": text2,
      "text3": text3,
      "Key": key,
      "text4": text4,
      "Image": image,
      "TypeMovie": typeMovie,
      "Videos": screenShots.map((i) => i.toJson()).toList(),
    };
  }
}
