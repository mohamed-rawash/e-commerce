import 'package:e_commerce/model/cart_product_model.dart';

class OrderModel{
  String? userId;
  String? dateTime;
  AddressModel? address;
  List<CartProductModel>? products;

  OrderModel({
    required this.userId,
    required this.dateTime,
    required this.address,
    required this.products,
  });

  OrderModel.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    dateTime = json['date_time'];
    address = AddressModel.fromJson(json['address']);
    products = json['products'] as List<CartProductModel>;
  }

  toJson(){
    return {
      'user_id': userId,
      'date_time': dateTime,
      'address': address,
      'products': products
    };
  }
}

class AddressModel{
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;

  AddressModel({
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.country,
  });

  AddressModel.fromJson(Map<String, dynamic> json){
    street1 = json['street1'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  toJson(){
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country
    };
  }
}