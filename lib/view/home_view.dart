import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/details_view.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeView extends GetWidget<AuthViewModel> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) =>Conditional.single(
        context: context,
        conditionBuilder: (BuildContext context) => !controller.loading.value,
        widgetBuilder: (BuildContext context) => Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.02,
              right: MediaQuery.of(context).size.width * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchTextFormFiled(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 110,
                  child: _categoriesListView(),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Selling',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      'See All',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: SizedBox(
                    child: _bestSellingListView(),
                  ),
                ),
              ],
            ),
          ),
        ),
        fallbackBuilder: (BuildContext context) => const Center(
          child: LoadingIndicator(
                indicatorType: Indicator.ballPulse, /// Required, The loading type of the widget
                colors: [
                  Colors.greenAccent,
                  Colors.purpleAccent,
                  Colors.pink,
                ],       /// Optional, The color collections
                strokeWidth: 1,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                backgroundColor: Colors.white,      /// Optional, Background of the widget
                pathBackgroundColor: Colors.white   /// Optional, the stroke backgroundColor
            ),
        ),
      ),
    );
  }

  Widget _searchTextFormFiled() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _categoriesListView() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoryModel.length,
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemBuilder: (context, index) => Container(
          width: 80,
          decoration: BoxDecoration(
            color: Colors.greenAccent.withOpacity(0.3),
            borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16), bottomRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                child: Card(
                  elevation: 0.0,
                  margin: EdgeInsets.all(0.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(
                      controller.categoryModel[index].image!,
                      fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                controller.categoryModel[index].name!,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bestSellingListView() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.productModel.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.to(DetailsView(model: controller.productModel[index])),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      elevation: 0.0,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.network(controller.productModel[index].image!, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    controller.productModel[index].name!,
                    style: Theme.of(context).textTheme.headline4,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    controller.productModel[index].description!,
                    style: Theme.of(context).textTheme.headline5,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${controller.productModel[index].price} \$',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }

}
