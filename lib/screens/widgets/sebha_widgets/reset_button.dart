import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/sehbah_provider/sebha_provider.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<SebhaProvider>(context, listen: false).resetAll();
        },
        icon: Container(
          width: 120.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: const Color(0xFF48a2bd),
              borderRadius: BorderRadius.circular(18)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              Text(
                'البدء من جديد',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ));
  }
}
