import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:multi_vendor_app/common/custom_appbar.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/common/heading.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/views/home/Widgets/category_list.dart';
import 'package:multi_vendor_app/views/home/Widgets/food_list.dart';
import 'package:multi_vendor_app/views/home/Widgets/nearby_restaurants_list.dart';

import 'recommendations_page.dart';
import 'all_fastest_foods_page.dart';
import 'all_nearby_restaurants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const CustomAppBar(),
      ),
      body: SafeArea(
          child: CustomContainer(
              containerContent: Column(
        children: [
          CategoryList(),
          Heading(
            text: "Try Something New",
            onTap: () {
              Get.to(() => RecommendationsPage(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 900));
            },
          ),
          const FoodsList(),
          Heading(
            text: "Nearby restaurants",
            onTap: () {
              Get.to(() => AllNearbyRestaurants(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 900));
            },
          ),
          const NearbyRestaurants(),
          Heading(
            text: "Fastest food closer to you",
            onTap: () {
              Get.to(() => AllFastestFoods(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 900));
            },
          ),
          const FoodsList(),
        ],
      ))),
    );
  }
}
