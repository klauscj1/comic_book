class CustomDetailModel {
  CustomDetailModel({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory CustomDetailModel.fromJson(Map<String, dynamic> json) =>
      CustomDetailModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
