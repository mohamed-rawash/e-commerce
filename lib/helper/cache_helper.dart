import 'dart:convert';

import 'package:e_commerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constance.dart';

class CacheHelper extends GetxController{

  Future<UserModel?> get getUser async {
    try{
      UserModel userModel = await _getUserData();
      return userModel;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USERDATA, json.encode(userModel.toJson()));
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(USERDATA);
    return UserModel.fromJson(json.decode(value!.toString()));
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}