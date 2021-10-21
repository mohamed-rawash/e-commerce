import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      builder: (controller) => Form(
        key: controller.formKey,
        child: Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                  Text(
                    'Billing address is the same as delivery address',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Street 1',
                      hintText: "21, Alex Davidson Avenue",
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'You must add your Street';
                      }
                    },
                    onSaved: (value){
                      controller.street1 = value;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Street 2',
                      hintText: "Opposite Omegatron, Vicent Quarters",
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'You must add your Street';
                      }
                    },
                    onSaved: (value){
                      controller.street2 = value;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'City',
                      hintText: "Victoria Island",
                    ),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'You must add your City';
                      }
                    },
                    onSaved: (value){
                      controller.city = value;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'State',
                              hintText: "Lagos State",
                            ),
                            validator: (String? value){
                              if(value!.isEmpty){
                                return 'You must add your State';
                              }
                            },
                            onSaved: (value){
                              controller.state = value;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Country',
                              hintText: "Nigeria",
                            ),
                            validator: (String? value){
                              if(value!.isEmpty){
                                return 'You must add your Country';
                              }
                            },
                            onSaved: (value){
                              controller.country = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}