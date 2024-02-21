import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/shimmers/nearby_shimmer.dart';
import 'package:multi_vendor_app/hooks/fetch_foods.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/views/home/Widgets/food_widget.dart';

class FoodsList extends HookWidget {
  const FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      height: 184.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (i) {
                FoodsModel food = foods[i];
                return FoodWidget(
                    image: food.imageUrl[0],
                    title: food.title,
                    time: food.time,
                    price: food.price.toStringAsFixed(2));
              }),
            ),
    );
  }
}
