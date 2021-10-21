import 'dart:convert';

import 'package:e_commerce/core/servcies/firestore_user.dart';
import 'package:e_commerce/helper/cache_helper.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/widgets/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  // FacebookLogin _facebookLogin = FacebookLogin();

  String? name;
  String? email;
  String? password;
  Rxn<User?> _user = Rxn<User>();
  CacheHelper _cacheHelper = Get.find();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null){
      getUserData(_auth.currentUser!.uid);
    }
  }

  googleSignIn() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuth.idToken,
      accessToken: googleSignInAuth.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) async{
      saveUser(user);
      Get.offAll(ControlView());
    });
  }

  // facebookSignIn() async {
  //   FacebookLoginResult result =
  //       await _facebookLogin.logIn(customPermissions: ["email"]);
  //
  //   final accessToken = result.accessToken!.token;
  //   final faceCredential = FacebookAuthProvider.credential(accessToken);
  //   await _auth.signInWithCredential(faceCredential);
  // }

  signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
            getUserData(_auth.currentUser!.uid);
        });
      Get.offAll(ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error Occurred',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  signUpWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async{

            saveUser(user);
      });
      Get.offAll(ControlView());
    }catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error Occurred',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  saveUser(UserCredential user) async{
    UserModel _userModel = UserModel(
      userId: user.user!.uid,
      name: name ?? user.user!.displayName,
      email: user.user!.email,
      image: 'default',);
    await FireStoreUser().addUserToFirestore(_userModel);
    setUser(_userModel);
  }
  getUserData(String uId) async {
    await FireStoreUser().getCurrentUser(uId).then((value){
      setUser(UserModel.fromJson(value.data()));
    });
  }

  setUser(UserModel userModel) async {
    await _cacheHelper.setUser(userModel);
  }
}


