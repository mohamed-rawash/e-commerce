import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_screen.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.1,
                              child: Container(
                                // height: MediaQuery.of(context).size.width * 0.25,
                                // width: MediaQuery.of(context).size.width * 0.25,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  color: Colors.grey,
                                ),
                                child: controller.userModel.image! == 'default'
                                    ? Image.asset(
                                        'assets/images/profile.png',
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        controller.userModel.image!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      controller.userModel.name!,
                                      style:Theme.of(context).textTheme.headline1,
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    controller.userModel.email!,
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Divider(
                          thickness: 2,
                          height: 2,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Container(
                          child: TextButton(
                            child: ListTile(
                              title: Text(
                                'Edit Profile',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              leading: const Icon(
                                Icons.edit,
                                size: 24,
                                color: Colors.black,
                              ),
                              trailing: const Icon(
                                Icons.navigate_next,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: ListTile(
                              title: Text(
                                'Shipping Address',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              leading: const Icon(
                                Icons.location_on,
                                size: 24,
                                color: Colors.black,
                              ),
                              trailing: const Icon(
                                Icons.navigate_next,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: ListTile(
                              title: Text(
                                'Order History',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              leading: const Icon(
                                Icons.history,
                                size: 24,
                                color: Colors.black,
                              ),
                              trailing: const Icon(
                                Icons.navigate_next,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: ListTile(
                              title: Text(
                                'Cards',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              leading: const Icon(
                                Icons.credit_card,
                                size: 24,
                                color: Colors.black,
                              ),
                              trailing: const Icon(
                                Icons.navigate_next,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: ListTile(
                              title: Text(
                                'Notifications',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              leading: const Icon(
                                Icons.notifications_active,
                                size: 24,
                                color: Colors.black,
                              ),
                              trailing: const Icon(
                                Icons.navigate_next,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        GetBuilder<ControlViewModel>(
                          builder: (control) => Container(
                            child: TextButton(
                              child: ListTile(
                                title: Text(
                                  'Log Out',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                leading: const Icon(
                                  Icons.logout,
                                  size: 24,
                                  color: Colors.black,
                                ),
                                trailing: const Icon(
                                  Icons.navigate_next,
                                  size: 24,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                controller.signOut();
                                Get.offAll(() => LoginScreen());
                                control.navValue = 0;
                                control.currentScreen = HomeView();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),

    );
  }
  Widget menuItem({required String text, required Icon icon, required BuildContext context}){
    return Container(
      child: TextButton(
        child: ListTile(
          title: Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: const Icon(
            Icons.edit,
            size: 24,
            color: Colors.black,
          ),
          trailing: const Icon(
            Icons.navigate_next,
            size: 24,
            color: Colors.black,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
