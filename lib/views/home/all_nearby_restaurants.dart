import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/back_ground_container.dart';
import 'package:multi_vendor_app/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor_app/hooks/fetch_all_restaurants.dart';
import 'package:multi_vendor_app/models/restaurants.dart';
import 'package:multi_vendor_app/views/home/Widgets/restaurant_tile.dart';

import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants("41007428");
    List<RestaurantModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        centerTitle: true,
        title: ReusableText(
            text: "Nearby Restaurants",
            style: appStyle(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: isLoading
              ? FoodsListShimmer()
              : ListView(
                  children: List.generate(restaurants!.length, (i) {
                    RestaurantModel restaurant = restaurants[i];
                    return RestaurantTile(
                      restaurant: restaurant,
                    );
                  }),
                ),
        ),
      ),
    );
  }
}
