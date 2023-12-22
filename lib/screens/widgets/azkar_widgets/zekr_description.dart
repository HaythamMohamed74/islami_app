import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/azkar_model.dart';

class ZekrDescription extends StatelessWidget {
  const ZekrDescription({
    super.key,
    required this.Azkarlist,
    required this.index,
  });

  final List<Zekr> Azkarlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: 112.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey,
          width: 1.w, // Set the border width
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        Azkarlist[index].description,
        textAlign: TextAlign.justify,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 24.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
