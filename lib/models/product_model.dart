import 'package:flutter/animation.dart';
import 'package:mvvm_usamaa_app/helper/extensions.dart';

class ProductModel {
  String? imgUrl;
  String? name;
  String? description;
  String? price;
  String? size;
  Color? color;
  String? productId;
  ProductModel(
      {this.description,
      this.imgUrl,
      this.name,
      this.price,
      this.size,
      this.color,
      this.productId});
  ProductModel.fromJson(Map<String, dynamic> jsonData) {
    if (jsonData == null) {
      return;
    }
    imgUrl = jsonData['image'];
    name = jsonData['name'];
    description = jsonData['description'];
    price = jsonData['price'];
    size = jsonData['size'];
    color = HexColor.fromHex(jsonData['color']);
    productId = jsonData["productId"];
  }
  toJson() {
    return {
      "image": imgUrl,
      "name": name,
      "description": description,
      "price": price,
      "size": size,
      "color": color,
      "productId": productId
    };
  }
}
