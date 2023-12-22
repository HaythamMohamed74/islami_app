import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/constants/app_strings.dart';
import 'package:quran/core/extention/context_extention.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/helper/arabic_surah.dart';
import '../../../models/surah_model.dart';
import '../../quran_view.dart';

class ListofQuranSowar extends StatelessWidget {
  const ListofQuranSowar({
    super.key,
    required this.surahList,
  });

  final List<Surah> surahList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: surahList.length,
      itemBuilder: (BuildContext context, int index) {
        // final verse = searchQuranResults[index];
        return GestureDetector(
          onTap: () {
            context.navigatorPush(
              PDFViewerFromAsset(
                pdfAssetPath: AssetsData.quranPdf,
                page: sowarPage[index],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF86ccad),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ArabicSurahNumber(
                              i: surahList[index].aya,
                              color: Colors.black,
                            ),
                            Text.rich(TextSpan(
                              children: [
                                TextSpan(
                                  text: ' ۝ ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      fontFamily:  AppStrings.quranFont,
                                      color: Colors.yellow.shade200),
                                ),
                              ],
                            )),
                          ],
                        ),
                        // Text(surahList[index].aya.toString()),
                        Text(
                          surahList[index].place,
                          style: const TextStyle(
                            fontFamily: AppStrings.quranFont,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      surahList[index].arabic,
                      style: TextStyle(
                          fontFamily: AppStrings.majeedFont,
                          color: Colors.white,
                          fontSize: 25.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
