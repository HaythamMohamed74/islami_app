import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/constants/app_strings.dart';
import 'package:quran/core/extention/context_extention.dart';

import '../../../core/constants/app_assets.dart';
import '../../list_of_quran.dart';

class QuranHomeWidget extends StatelessWidget {
  const QuranHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.h,
          width: 140.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              color: const Color(0xFF86ccad)),
        ),
        Positioned(
            top: 20.h,
            child: Image.asset(
              AssetsData.quranHomeImage,
              width: 70.w,
            )),
        Positioned(
            top: 120.h,
            left: 9.h,
            child: Column(
              children: [
                Text(
                  AppStrings.quranKareem,
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
                    context.navigatorPush(const ListOfQuran());
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
