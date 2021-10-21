import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ControlView extends GetWidget<AuthViewModel> {
  ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
                  init: Get.find<ControlViewModel>(),
                  builder: (controller) => Scaffold(body: controller.currentScreen, bottomNavigationBar: bottomNavBar(),),);
    });
  }
  Widget bottomNavBar(){
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder: (controler) => BottomNavyBar(
        showElevation: true, // use this to remove appBar's elevation
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.explore),
            title: const Text('Explor'),
            activeColor: Colors.greenAccent,
          ),
          BottomNavyBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              activeColor: Colors.purpleAccent
          ),
          BottomNavyBarItem(
              icon: const Icon(Icons.perm_identity),
              title: const Text('Account'),
              activeColor: Colors.pink
          ),
        ],
        curve: Curves.linear,
        selectedIndex:controler.navValue,
        onItemSelected: (index){
          controler.selectedNavItem(index);
        },
      ),
    );
  }
}
