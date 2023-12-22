import 'package:flutter/material.dart';
import 'package:quran/core/constants/app_strings.dart';
import 'package:quran/core/helper/data_functions.dart';
import 'package:quran/models/azkar_model.dart';
import 'package:quran/screens/widgets/azkar_widgets/zekr_count.dart';
import 'package:quran/screens/widgets/azkar_widgets/zekr_description.dart';
import 'package:quran/screens/widgets/azkar_widgets/zekr_widget.dart';

class AzkarDetails extends StatefulWidget {
  final String category;
  const AzkarDetails({
    super.key,
    required this.category,
  });
  @override
  _AzkarDetailsState createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
  List<Zekr> Azkarlist = [];

  @override
  void initState() {
    super.initState();
    loadAzkarList(categ: '${widget.category}').then((zekrList) {
      setState(() {
        Azkarlist = zekrList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        centerTitle: true,
        title: Text(
          widget.category,
          style: const TextStyle(fontFamily: AppStrings.tajwalFont),
        ),
      ),
      body: ListView.builder(
        itemCount: Azkarlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        ZekrWidget(
                          Azkarlist: Azkarlist,
                          index: index,
                        ),
                        ZekrCount(
                          Azkarlist: Azkarlist,
                          index: index,
                        )
                      ],
                    ),
                  ),
                  Azkarlist[index].description.isEmpty
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ZekrDescription(
                            Azkarlist: Azkarlist,
                            index: index,
                          ),
                        ),
                ],
              ));
        },
      ),
    );
  }
}
