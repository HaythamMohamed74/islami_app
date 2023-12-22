import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/constants/app_strings.dart';
import 'package:quran/core/extention/context_extention.dart';

import '../../../core/constants/app_assets.dart';
import '../../sebha_main_screen.dart';

class SebhaHomeWidget extends StatelessWidget {
  const SebhaHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160.h,
          width: 150.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              color: const Color(0xFF48a2bd)),
        ),
        Positioned(
            top: 12.h,
            left: 14.h,
            child: Image.asset(
              AssetsData.beadsImage,
              width: 70.w,
            )),
        Positioned(
            top: 80.h,
            left: 14.h,
            child: Column(
              children: [
                Text(
                  AppStrings.sebha,
                  style: TextStyle(
                      fontFamily: AppStrings.utmamiFont,
                      color: Colors.white,
                      fontSize: 24.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    context.navigatorPush(const SebhaMainScreen());
                  },
                  child: const Row(
                    children: [
                      Text(
                        AppStrings.goNow,
                        style: TextStyle(
                            fontFamily: AppStrings.tajwalFont, fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
