import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_vendor_app/common/app_style.dart';
import 'package:multi_vendor_app/common/back_ground_container.dart';
import 'package:multi_vendor_app/common/reusable_text.dart';
import 'package:multi_vendor_app/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/hooks/fetch_all_categories.dart';
import 'package:multi_vendor_app/models/categories.dart';

import '../../constants/uidata.dart';

import 'Widgets/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        centerTitle: true,
        title: ReusableText(
          text: 'Categories',
          style: appStyle(12, kGray, FontWeight.w600),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(categories!.length, (i) {
                    CategoriesModel category = categories[i];
                    return CategoryTile(category: category);
                  }),
                ),
        ),
      ),
    );
  }
}
