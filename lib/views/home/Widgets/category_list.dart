import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/common/shimmers/categories_shimmer.dart';
import 'package:multi_vendor_app/controllers/category_controller.dart';
import 'package:multi_vendor_app/hooks/fetch_categories.dart';
import 'package:multi_vendor_app/models/categories.dart';

import 'category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoriesModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    final controller = Get.put(CategoryController());
    return isLoading
        ? const CatergoriesShimmer()
        : Container(
            height: 85.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categoriesList!.length, (i) {
                CategoriesModel category = categoriesList[i];
                return CategoryWidget(category: category);
              }),
            ),
          );
  }
}
