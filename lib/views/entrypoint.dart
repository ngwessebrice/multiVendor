import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/tab_index_controller.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_vendor_app/views/cart/cart_page.dart';
import 'package:multi_vendor_app/views/home/home_page.dart';
import 'package:multi_vendor_app/views/profile/profile_page.dart';
import 'package:multi_vendor_app/views/search/search_page.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());

    return Obx(() => Scaffold(
      body: Stack(
        children: [

          pageList[controller.tabIndex],

          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
                data: Theme.of(context).copyWith(canvasColor: kPrimary),
                child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    unselectedIconTheme: const IconThemeData(color: Colors.black38),
                    selectedIconTheme: IconThemeData(color: kSecondary),

                    onTap: (value) {
                        controller.setTabIndex = value;
                    },
                    currentIndex: controller.tabIndex,

                    items: [
                      BottomNavigationBarItem(
                          icon: controller.tabIndex == 0
                              ? Icon(Icons.store)
                              : Icon(Icons.store_outlined),
                          label: 'Home'),
                      const BottomNavigationBarItem(
                          icon: Icon(Icons.search), label: 'Search'),
                      BottomNavigationBarItem(
                          icon:  Badge(
                            label: Text('1'),
                              child: Icon(Icons.add_shopping_cart_outlined)),
                          label: 'Cart'),
                      BottomNavigationBarItem(
                          icon: controller.tabIndex == 3
                          ? Icon(Icons.person_rounded)
                          : Icon(Icons.person_2_outlined),
                          label: 'Profile'),
                    ]
                )
            ),
          ),

        ],
      ),
    ));
  }
}
