import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/constants/app_assets.dart';

class LastReadQuran extends StatelessWidget {
  const LastReadQuran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120.h,
          width: 340.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30).r,
              color: const Color(0xFF52C2AC)),
        ),
        Positioned(
            top: 40.h,
            bottom: 0.h,
            child: Column(
              children: [
                Text(
                  ' توقفت قراه عند سوره البقره ايه 25',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'majeed'),
                ),
                TextButton(onPressed: () {}, child: Text(''))
              ],
            )),
        Positioned(
            top: 10.h,
            bottom: 10.h,
            right: 18.h,
            child: Image.asset(
              AssetsData.quran,
              // width: 35,
            ))
      ],
    );
  }
}
