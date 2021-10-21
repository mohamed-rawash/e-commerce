import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/helper/enums.dart';
import 'package:e_commerce/view/widgets/add_address_widget.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/delevery_time_widget.dart';
import 'package:e_commerce/view/widgets/summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';
import 'package:e_commerce/constance.dart';

class CheckoutView extends GetWidget<CheckoutViewModel> {

  List _processes = [
    'Delivery',
    'Address',
    'Summer',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(),
            controller.pages == Pages.DeliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.AddAddress
                    ? AddAddress()
                    : Summary(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  if(controller.index > 0 )
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          width: Get.width,
                          margin: EdgeInsets.all(0.0),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Text(
                            'BACK',
                            style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: (){
                          controller.changeIndex(controller.index - 1);
                        },
                      ),
                    ),
                  Spacer(),
                  Expanded(
                    child: CustomButton(text: 'Next', onPressed: (){
                      controller.changeIndex(controller.index + 1);

                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
