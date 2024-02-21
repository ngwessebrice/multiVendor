import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/shimmers/nearby_shimmer.dart';
import 'package:multi_vendor_app/hooks/fetch_restaurants.dart';
import 'package:multi_vendor_app/models/restaurants.dart';
import 'package:multi_vendor_app/views/home/Widgets/restaurant_widget.dart';

class NearbyRestaurants extends HookWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("41007428");
    List<RestaurantModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      height: 194.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(restaurants!.length, (i) {
                RestaurantModel restaurant = restaurants[i];
                return RestaurantWidget(
                    image: restaurant.imageUrl,
                    logo: restaurant.logoUrl,
                    title: restaurant.title,
                    time: restaurant.time,
                    rating: "7547");
              }),
            ),
    );
  }
}
