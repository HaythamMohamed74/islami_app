import 'package:flutter/material.dart';
import 'package:quran/core/constants/app_strings.dart';
import 'package:share/share.dart';

import '../../../models/azkar_model.dart';

class ZekrCount extends StatelessWidget {
  const ZekrCount({
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: Azkarlist[index].count.isEmpty
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: [
            Azkarlist[index].count.isEmpty
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      ':${AppStrings.repeat} ${Azkarlist[index].count}',
                      style: const TextStyle(fontFamily: AppStrings.baseFont),
                    ),
                  ),
            GestureDetector(
              onTap: () async {
                await Share.share(Azkarlist[index].zekr);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(15)),
                child: const Row(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.blue,
                      // color:
                      //     Color.fromARGB(255, 67, 58, 82),
                    ),
                    Text(
                      AppStrings.share,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
