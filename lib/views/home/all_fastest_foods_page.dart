import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/app_style.dart';
import 'package:multi_vendor_app/common/reusable_text.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/views/home/Widgets/food_tile.dart';

import '../../common/back_ground_container.dart';
import '../../constants/uidata.dart';

class AllFastestFoods extends StatelessWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        centerTitle: true,
        title: ReusableText(text: "Fastest Foods",
            style: appStyle(13,kLightWhite, FontWeight.w600)),
      ),
      body:BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.all(12.h),
          child: ListView(
            children: List.generate(foods.length, (i) {
              var food = foods[i];
              return FoodTile(food: food);
            }),
          ),
        ),),
    );
  }
}
