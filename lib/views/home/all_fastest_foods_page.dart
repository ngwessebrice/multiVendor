import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/app_style.dart';
import 'package:multi_vendor_app/common/reusable_text.dart';
import 'package:multi_vendor_app/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/hooks/fetch_all_foods.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/views/home/Widgets/food_tile.dart';

import '../../common/back_ground_container.dart';

class AllFastestFoods extends HookWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        centerTitle: true,
        title: ReusableText(
            text: "Fastest Foods",
            style: appStyle(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: isLoading
              ? FoodsListShimmer()
              : ListView(
                  children: List.generate(foods!.length, (i) {
                    FoodsModel food = foods[i];
                    return FoodTile(food: food);
                  }),
                ),
        ),
      ),
    );
  }
}
