import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/screens/widgets/book_mark_widget.dart';
import 'package:quran/screens/widgets/home_screen_widgets/azkar_home.dart';
import 'package:quran/screens/widgets/home_screen_widgets/header_image_home_screen.dart';
import 'package:quran/screens/widgets/home_screen_widgets/last_read_quran.dart';
import 'package:quran/screens/widgets/home_screen_widgets/quarn_home.dart';
import 'package:quran/screens/widgets/home_screen_widgets/sebha_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderImage(),
            SizedBox(
              height: 5.h,
            ),
            const LastReadQuran(),
            Padding(
              padding: const EdgeInsets.all(6.0).h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0).h,
                    child: const QuranHomeWidget(),
                  ),
                  SizedBox(
                    width: 25.h,
                  ),
                  const AzkarHomeWidget(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0).h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SebhaHomeWidget(),
                  Padding(
                    padding: const EdgeInsets.all(5.0).h,
                    child: const BookMarkWidget(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Custom container
