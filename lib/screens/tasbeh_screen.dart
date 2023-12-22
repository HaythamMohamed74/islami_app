import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quran/core/extention/context_extention.dart';
import 'package:quran/providers/sehbah_provider/sebha_provider.dart';
import 'package:quran/screens/widgets/sebha_widgets/reset_button.dart';

import '../core/constants/app_strings.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({
    super.key,
    required this.tasbehZekrName,
  });
  final String tasbehZekrName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.navigatorPop();
            Provider.of<SebhaProvider>(context, listen: false).resetAll();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                tasbehZekrName,
                style: TextStyle(
                    fontFamily: AppStrings.utmamiFont,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700),
              )),
          Padding(
            padding: EdgeInsets.all(8.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ':${AppStrings.tasbehCount}${Provider.of<SebhaProvider>(context).counter}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: AppStrings.baseFont),
                ),
                Text(
                  '${AppStrings.turnCount}:${Provider.of<SebhaProvider>(context).turns}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: AppStrings.baseFont),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          CircularPercentIndicator(
            radius: 85.0.r,
            lineWidth: 5.0.w,
            percent: Provider.of<SebhaProvider>(context).parcent,
            progressColor: const Color(0xFF48a2bd),
            center: GestureDetector(
              onTap: () {
                Provider.of<SebhaProvider>(context, listen: false)
                    .tabOnTasbeh();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  '  ${(Provider.of<SebhaProvider>(context).counter)} ',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 60.sp),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const Center(child: ResetButton())
        ],
      ),
    );
  }
}
