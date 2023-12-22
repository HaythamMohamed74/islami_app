import 'package:flutter/material.dart';
import 'package:quran/core/helper/ar_numbers.dart';

class ArabicSurahNumber extends StatelessWidget {
  const ArabicSurahNumber(
      {Key? key, required this.i, this.color = Colors.black})
      : super(key: key);

  final int i;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      (i).toString().toArabicNumbers,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        color: color,
        fontFamily: "me_quran",
        fontSize: 12.0,
      ),
    );
  }
}
