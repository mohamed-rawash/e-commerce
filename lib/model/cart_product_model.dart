class CartProductModel{
  String? productId;
  String? name;
  String? image;
  String? price;
  int? quantity;

  CartProductModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });
  CartProductModel.fromJson(Map<String, dynamic> json){
    productId = json['productId'];
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
  }
  toJson(){
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price
    };
  }
}