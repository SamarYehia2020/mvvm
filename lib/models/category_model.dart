class CategoryModel {
  String? name;
  String? imgUrl;
  CategoryModel({this.name, this.imgUrl});
  CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    if (jsonData == null) return;
    name = jsonData['name'];
    imgUrl = jsonData['image'];
  }
  toJson() {
    return {"name": name, "image": imgUrl};
  }
}
