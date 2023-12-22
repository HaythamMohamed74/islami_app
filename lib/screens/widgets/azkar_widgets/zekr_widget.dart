import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/constants/app_strings.dart';

import '../../../models/azkar_model.dart';

class ZekrWidget extends StatelessWidget {
  const ZekrWidget({
    super.key,
    required this.Azkarlist,
    required this.index,
  });

  final List<Zekr> Azkarlist;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      child: Text(
        Azkarlist[index].zekr,
        textAlign: TextAlign.justify,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 20.sp,
          color: Colors.black,
          fontFamily:AppStrings.baseFont,
        ),
      ),
    );
  }
}
