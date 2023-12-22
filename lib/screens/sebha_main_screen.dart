import 'package:flutter/material.dart';
import 'package:quran/core/constants/sebha_zekr.dart';
import 'package:quran/core/extention/context_extention.dart';
import 'package:quran/screens/tasbeh_screen.dart';
import 'package:quran/screens/widgets/sebha_widgets/sebha_zekr_widget.dart';

class SebhaMainScreen extends StatelessWidget {
  const SebhaMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: sebhaZekr.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  context.navigatorPush(TasbeehScreen(
                    tasbehZekrName: sebhaZekr[index],
                  ));
                },
                child: SebhaZekr(
                  index: index,
                ),
              ),
            );
          }),
    );
  }
}
