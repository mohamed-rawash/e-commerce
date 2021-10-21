import 'package:e_commerce/helper/cache_helper.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends GetxController {

  CacheHelper _cacheHelper = Get.find();
  UserModel? _userModel;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;
  UserModel get userModel => _userModel!;

  @override
  void onInit() {
    super.onInit();

    getCurrentUser();

  }

  getCurrentUser() async {
    _loading.value = true;
    await _cacheHelper.getUser
        .then((value) {
          _userModel = value;
    });
    _loading.value = false;
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    await _cacheHelper.deleteUser();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}