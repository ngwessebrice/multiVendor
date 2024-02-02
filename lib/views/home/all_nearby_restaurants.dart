import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/back_ground_container.dart';
import 'package:multi_vendor_app/views/home/Widgets/restaurant_tile.dart';

import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';
import '../../constants/uidata.dart';

class AllNearbyRestaurants extends StatelessWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        centerTitle: true,
        title: ReusableText(text: "Nearby Restaurants",
            style: appStyle(13,kLightWhite, FontWeight.w600)),
      ),
      body: BackGroundContainer(
          color: Colors.white,
          child: Padding(
            padding:  EdgeInsets.all(12.h),
            child: ListView(
              children: List.generate(restaurants.length, (i) {
                var restaurant = restaurants[i];
                return RestaurantTile(restaurant: restaurant,);
                }),
                  ),
          ),),
    );
  }
}
