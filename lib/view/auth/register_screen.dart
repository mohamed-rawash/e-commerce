import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/widgets/custom_sin_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';


class RegisterScreen extends GetWidget<AuthViewModel> {
   RegisterScreen({Key? key}) : super(key: key);

   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   TextEditingController _passwordController = TextEditingController();

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
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 10),
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
                              labelText: 'Name',
                              focusColor: primaryColor,
                            ),
                            onSaved: (val){
                              controller.name = val;
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
                            controller: _passwordController,
                            onSaved: (val){
                              controller.password = val;
                            },
                            validator: (val){
                              if(val!.isEmpty){
                                print('empty');
                                return 'empty';
                              }
                              if(val != _passwordController.text){
                                return 'password did not match';
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
                              labelText: 'Confirm Password',
                              focusColor: primaryColor,
                            ),
                            obscureText: true,
                            validator: (val){
                              if(val!.isEmpty){
                                print('empty');
                                return 'empty';
                              }
                            },
                          ),
                          const SizedBox(height: 45),
                          CustomSignButton(
                            text: 'Sign Up',
                            function: (){
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                controller.signUpWithEmailAndPassword();
                              }
                            },
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
