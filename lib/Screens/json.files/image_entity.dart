class ImageEntity {
  ImageEntity({
    this.image = "",
    this.title = "",
    this.video = "",
  });
  String image;
  String title;
  String video;

  ImageEntity.fromMap(Map<dynamic, dynamic> data)
      : image = data["image"],
        title = data["title"],
        video = data["video"];

  toJson() {
    return {
      "image": image,
      "title": title,
      "video": video,
    };
  }
}
