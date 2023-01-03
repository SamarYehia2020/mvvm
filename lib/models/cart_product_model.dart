class CartProductModel {
  String? imgUrl, name, price, productId;
  late int quantity;

  CartProductModel(
      {this.imgUrl, this.name, this.price, this.productId, this.quantity = 0});
  CartProductModel.fromJson(Map<String, dynamic> jsonData) {
    if (jsonData == null) return;
    imgUrl = jsonData["image"];
    name = jsonData["name"];
    price = jsonData["price"];
    // quantity = jsonData["quantity"] ?? 1;
    productId = jsonData["productId"];
    quantity = jsonData["quantity"];
  }
  toJson() {
    return {
      "image": imgUrl,
      "name": name,
      "price": price,
      "quantity": quantity,
      "productId": productId
    };
  }
}
