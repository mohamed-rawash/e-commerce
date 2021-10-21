import 'package:e_commerce/helper/extention.dart';
import 'package:flutter/material.dart';

class ProductModel{
  String? productId;
  String? name;
  String? image;
  String? description;
  String? size;
  String? price;
  Color? color;

  ProductModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.size,
    required this.price
  });

  ProductModel.fromJson(Map<String, dynamic> json){
    productId = json['productId'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    color = HexColor.fromHex(json['color']);
    size = json['size'];
    price = json['price'];
  }

  toJson(){
    return{
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price
    };
  }
}