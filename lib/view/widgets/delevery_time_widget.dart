import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/helper/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryTime extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      builder: (controller) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RadioListTile<Delevery>(
              value: Delevery.StandardDelivery,
              groupValue: controller.delevery,
              onChanged: (value){
                controller.changeDeleveryStatus(value);
              },
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(
                'Standard Delivery',
                style: Theme.of(context).textTheme.headline1,
              ),
              subtitle: Text(
                '\nOrder will be delivered between 3 - 5 business days',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RadioListTile<Delevery>(
              value: Delevery.NextDayDelivery,
              groupValue: controller.delevery,
              onChanged: (value){
                controller.changeDeleveryStatus(value);
              },
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(
                'Next Day Delivery',
                style: Theme.of(context).textTheme.headline1,
              ),
              subtitle: Text(
                '\nPlace your order before 6pm and your items will be delivered the next day',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RadioListTile<Delevery>(
              value: Delevery.NominatedDelivery,
              groupValue: controller.delevery,
              onChanged: (value){
                controller.changeDeleveryStatus(value);
              },
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(
                'Nominated Delivery',
                style: Theme.of(context).textTheme.headline1,
              ),
              subtitle: Text(
                '\nPick a particular date from the calendar and order will be delivered on selected date',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}