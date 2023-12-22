import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/constants/app_strings.dart';
import 'package:quran/screens/book_mark_screen.dart';

import '../../core/constants/app_assets.dart';

class BookMarkWidget extends StatelessWidget {
  const BookMarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150.h,
          width: 150.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              color: const Color(0xFFccebed)),
        ),
        Positioned(
            top: 8.h,
            left: 8.h,
            child: Image.asset(
              AssetsData.bookMarkImage,
              width: 70.w,
            )),
        Positioned(
            top: 75.h,
            left: 5.h,
            child: Column(
              children: [
                Text(
                  'الصفحات المحفوظه',
                  style: TextStyle(
                      fontFamily: AppStrings.utmamiFont,
                      color: Colors.white,
                      fontSize: 22.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const BookMarkScreen()));
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
