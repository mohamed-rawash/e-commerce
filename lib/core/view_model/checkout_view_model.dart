import 'package:e_commerce/helper/enums.dart';
import 'package:e_commerce/view/widgets/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class CheckoutViewModel extends GetxController{
  int _index = 0;
  Pages _pages = Pages.DeliveryTime;
  Delevery _delevery = Delevery.StandardDelivery;
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int get index => _index;
  Pages get pages => _pages;
  Delevery get delevery => _delevery;

  void changeIndex(int index){
    if(index == 0 || index < 0){
      _pages = Pages.DeliveryTime;
      _index = index;
    }
    if(index == 1){
      _pages = Pages.AddAddress;
      _index = index;
    }else if(index == 2){
      formKey.currentState!.save();
      if(formKey.currentState!.validate()) {
        _pages = Pages.Summary;
        _index = index;
      }
    }else if(index == 3){
      Get.to(() => ControlView());
      _pages = Pages.DeliveryTime;
      _index = 0;
    }
    update();
  }

  Color getColor(int index) {
    if (index == _index) {
      return inProgressColor;
    } else if (index < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  changeDeleveryStatus(value){
    _delevery = value;
    update();
  }
}