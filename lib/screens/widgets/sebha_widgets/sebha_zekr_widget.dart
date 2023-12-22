import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/constants/app_strings.dart';

import '../../../core/constants/sebha_zekr.dart';

class SebhaZekr extends StatelessWidget {
  const SebhaZekr({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF48a2bd),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              sebhaZekr[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 25.sp, fontFamily:AppStrings.tajwalFont),
            ),
            Text(
              sebhaZekrDesc[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontSize: 18.sp, fontFamily: AppStrings.tajwalFont),
            ),
          ],
        ),
      ),
    );
  }
}
