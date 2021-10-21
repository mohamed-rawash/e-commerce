import 'package:e_commerce/core/servcies/database/cart_database_helper.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{

  CartDatabaseHelper dbHelper = CartDatabaseHelper.db;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProducts = [];
  static double _totalPrice = 0.0;

  ValueNotifier<bool> get loading => _loading;
  List<CartProductModel> get cartProducts => _cartProducts;
  double get totalPrice => _totalPrice;

  CartViewModel(){
    getProducts();
  }

  addProduct(CartProductModel cartProductModel) async {
      for(var i = 0; i < _cartProducts.length; i++){
        if(_cartProducts[i].productId == cartProductModel.productId){
          return;
        }
      }
      await dbHelper.insert(cartProductModel);
      _cartProducts.add(cartProductModel);
      _totalPrice += (double.parse(cartProductModel.price!) * cartProductModel.quantity!);
    update();
  }

  getProducts() async {
    _loading.value = true;
    _cartProducts = await dbHelper.getAllProduct();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice(){
    for(var i = 0; i < _cartProducts.length - 1; i++){
      _totalPrice += (double.parse(_cartProducts[i].price!) * _cartProducts[i].quantity!);
    }
    print(_totalPrice);
    update();
  }

  increaseQuantity(int index) async {
    int _quantity = _cartProducts[index].quantity!;
    _quantity++;
    _totalPrice += (double.parse(_cartProducts[index].price!));
    _cartProducts[index].quantity = _quantity;
    await dbHelper.updateProduct(_cartProducts[index]);
    update();
  }

  decreaseQuantity(int index) async {
    int _quantity = _cartProducts[index].quantity!;
    if(_quantity == 1){
      return;
    }
    _quantity--;
    _totalPrice -= (double.parse(_cartProducts[index].price!));
    _cartProducts[index].quantity = _quantity;
    await dbHelper.updateProduct(_cartProducts[index]);
    update();
  }

}