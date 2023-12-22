
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/helper/data_functions.dart';

class AyahSearch extends StatelessWidget {
  const AyahSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        var result = searchResults[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade300,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Share.share(result['content']);
                        },
                        icon: Icon(
                          Icons.share,
                          size: 25,
                          color: Colors.yellow.shade200,
                        )),
                    Text(
                      'سوره  ${result['surah']}  آية:   ${result['verseNumber']}',
                      style: TextStyle(
                          fontFamily: AppStrings.majeedFont,
                          fontSize: 18,
                          color: Colors.yellow.shade200),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          result['content'],
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontFamily: AppStrings.quranFont, fontSize: 18.sp),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}