// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/servcies/home_services.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{

  List<CategoryModel> _categoryModel = [];
  List<ProductModel> _productModel = [];
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<ProductModel> get productModel => _productModel;
  ValueNotifier<bool> get loading => _loading;

  HomeViewModel(){
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async{
    _loading.value = true;
    Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> value =  HomeService().getCategory();
    value.then((value) {
      value.forEach((element) {
        _categoryModel.add(
          CategoryModel.fromJson(element.data()),
        );
      });
      _loading.value = false;
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> value =  HomeService().getBestSelling();
    value.then((value) {
      value.forEach((element) {
        _productModel.add(
          ProductModel.fromJson(element.data()),
        );
      });
      _loading.value = false;
      update();
    });
  }
}