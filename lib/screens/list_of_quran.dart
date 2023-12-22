import 'package:flutter/material.dart';
import 'package:quran/screens/widgets/quran_widgets/list_of_quran_sowar.dart';
import 'package:quran/screens/widgets/quran_widgets/quran_ayay_search.dart';
import '../core/constants/app_strings.dart';
import '../core/helper/data_functions.dart';
import '../models/surah_model.dart';

class ListOfQuran extends StatefulWidget {
  const ListOfQuran({Key? key}) : super(key: key);

  @override
  _ListOfQuranState createState() => _ListOfQuranState();
}

class _ListOfQuranState extends State<ListOfQuran> {
  late List<Surah> surahList = [];
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchSurahList();
  }

  Future<void> fetchSurahList() async {
    List<Surah> fetchedSurahList = await surahName();
    setState(() {
      surahList = fetchedSurahList;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Display the list of Surah names
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title:  const Text(
              AppStrings.quarn,
              style: TextStyle(fontFamily: AppStrings.tajwalFont),
            )),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
                cursorColor: Colors.blue,
                textDirection: TextDirection.rtl,
                onFieldSubmitted: (value) {
                  print(value);
                  setState(() {
                    searchContent(value);
                  });
                },
                decoration: InputDecoration(
                    hintText: AppStrings.searchAboutAyayh,
                    hintStyle: const TextStyle(fontFamily: AppStrings.tajwalFont),
                    hintTextDirection: TextDirection.rtl,
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            if (controller.text.isEmpty)
              Expanded(
                child: ListofQuranSowar(surahList: surahList),
              )
            else
            const   Expanded(
                child: AyahSearch(),
              )
          ],
        ));
  }
}




