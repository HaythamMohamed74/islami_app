import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/constants/app_strings.dart';
import 'package:quran/core/extention/context_extention.dart';

import '../../../core/constants/azkar_name.dart';
import '../../../core/helper/data_functions.dart';
import '../../azkar_details.dart';

class ListofAzkar extends StatelessWidget {
  const ListofAzkar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.text.isNotEmpty
            ? listOnSearch.length
            : azkarNames.length,
        itemBuilder: (BuildContext, int index) {
          final categoryName =
              controller.text.isEmpty ? azkarNames[index] : listOnSearch[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                context.navigatorPush(AzkarDetails(
                  category: categoryName,
                ));
              },
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    categoryName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontFamily: AppStrings.tajwalFont),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
