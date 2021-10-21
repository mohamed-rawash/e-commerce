import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/view/auth/register_screen.dart';
import 'package:e_commerce/view/widgets/custom_sin_button.dart';
import 'package:e_commerce/view/widgets/custom_social_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends GetWidget<AuthViewModel> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 15, right: 15,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text(
                      'Welcome,',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(() => RegisterScreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Sign in to continue',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email',
                              focusColor: primaryColor,
                            ),
                            onSaved: (val){
                              controller.email = val;
                            },
                            validator: (val){
                              if(val!.isEmpty){
                                print('empty');
                                return 'empty';
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Password',
                              focusColor: primaryColor,
                            ),
                            obscureText: true,
                            onSaved: (val){
                              controller.password = val;
                            },
                            validator: (val){
                              if(val!.isEmpty){
                                print('empty');
                                return 'empty';
                              }
                            },
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forget Password?',
                                style: Theme.of(context).textTheme.headline2,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          CustomSignButton(
                            text: 'Sign In',
                            function: (){
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                controller.signInWithEmailAndPassword();
                                Get.put(ControlViewModel());
                              }
                            },
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            '--------------- OR ---------------',
                          ),
                          const SizedBox(height: 35),
                          Row(
                            children: [
                              Expanded(
                                child: CustomSocialButton(
                                  text: 'Facebook',
                                  icon: Icon(Icons.facebook, color: Colors.white,),
                                  color: Colors.blue,
                                  onPressed: (){},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: CustomSocialButton(
                                  text: 'Google',
                                  icon: Icon(Icons.g_mobiledata_sharp, color: Colors.white,),
                                  color: Colors.red,
                                  onPressed: (){
                                    controller.googleSignIn();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
