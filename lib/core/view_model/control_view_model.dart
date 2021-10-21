import 'package:e_commerce/view/cart_view.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{
  int navValue = 0;

  Widget currentScreen = HomeView();


  void selectedNavItem(index){
    navValue = index;
    switch(navValue){
      case 0:
        currentScreen = HomeView();
        break;
      case 1:
        currentScreen = CartView();
        break;
      case 2:
        currentScreen = ProfileView();
        break;
    }
    update();
  }
}