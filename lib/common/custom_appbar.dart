import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/app_style.dart';
import 'package:multi_vendor_app/common/reusable_text.dart';
import 'package:multi_vendor_app/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal:  12.w, vertical: 6.h),
      height: 110.h,
      color: kOffWhite,
        child: Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
               crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 23.r,
                    backgroundColor: kSecondary,
                    backgroundImage: const AssetImage('assets/icons/avatar.png')
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            ReusableText(text: "Deliver to", style: appStyle(13, kSecondary, FontWeight.w600)),
                            SizedBox(
                              width: width * 0.65,
                              child: Text("Cibec Bonaberi Douala",
                                overflow: TextOverflow.ellipsis,
                                style: appStyle(13, kGrayLight, FontWeight.normal),),
                            ),
                      ],
                    ),
                  ),

                   Text(getTimeOfDay(),
                    style:  const TextStyle(fontSize: 35),)
                ],
              ),
            ],
          ),
        ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if(hour >= 0 && hour < 12) {
      return '☀️';
    } else if (hour >= 12 && hour < 16) {
      return '⛅';
    }else {
      return '🌙';
    }
  }
}
