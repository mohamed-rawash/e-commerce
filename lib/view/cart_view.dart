import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'checkout/checkout_view.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      // init: Get.find(),
      builder: (controller) => controller.cartProducts.isEmpty
          ? Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Products Yet!',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SvgPicture.asset(
                    'assets/images/empty.svg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                ],
              ),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (context, index) => _cartItem(
                          controller.cartProducts[index], context, index),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Price',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            GetBuilder<CartViewModel>(
                              // init: Get.find(),
                              builder: (controller) => Text(
                                '${controller.totalPrice} \$',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                          text: 'Checkout',
                          onPressed: () {
                            Get.to(() => CheckoutView());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _cartItem(
      CartProductModel productModel, BuildContext context, int index) {
    return SizedBox(
      height: 180,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(0.3)),
        child: Row(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.network(
                productModel.image!,
                fit: BoxFit.cover,
                height: 180,
                width: 140,
              ),
            ),
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productModel.name!,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 15),
                  Text('${productModel.price} \$',
                      style: Theme.of(context).textTheme.headline2),
                ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GetBuilder<CartViewModel>(
                // init: Get.find(),
                builder: (controller) => MaterialButton(
                  minWidth: 10,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    controller.decreaseQuantity(index);
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.remove_circle_outline,
                    size: 34,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${productModel.quantity}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              GetBuilder<CartViewModel>(
                // init: Get.find(),
                builder: (controller) => MaterialButton(
                  padding: EdgeInsets.all(0),
                  minWidth: 10,
                  onPressed: () {
                    controller.increaseQuantity(index);
                  },
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.add_circle,
                    size: 34,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
