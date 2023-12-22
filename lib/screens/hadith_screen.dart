import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/helper/data_functions.dart';
import 'package:quran/models/hadith_model.dart';

import '../core/constants/app_strings.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<Hadith> Hadithlist = [];

  @override
  void initState() {
    super.initState();
    loadHadithList().then((hadithlist) {
      setState(() {
        Hadithlist = hadithlist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            AppStrings.hadith,
            style: TextStyle(fontFamily: AppStrings.tajwalFont),
          )),
      body: ListView.builder(
        itemCount: Hadithlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Hadithlist[index].hadith,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontFamily: AppStrings.tajwalFont, fontSize: 20.sp),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
