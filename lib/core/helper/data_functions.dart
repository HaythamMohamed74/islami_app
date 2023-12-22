import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/core/constants/azkar_name.dart';
import 'package:quran/core/constants/quran_data.dart';
import 'package:quran/models/hadith_model.dart';

import '../../models/azkar_model.dart';
import '../../models/surah_model.dart';

Future<List<Zekr>> loadAzkarList({required String categ}) async {
  String jsonString = await rootBundle.loadString('assets/data/azkar.json');
  List<dynamic> zekrList = json.decode(jsonString);
  List<Zekr> filteredZekrList = zekrList
      .map((item) => Zekr.fromJson(item))
      .where((zekr) => zekr.category == '$categ')
      .toList();
  return filteredZekrList;
}

List<String> listOnSearch = [];

searchInList({required String query}) {
  listOnSearch =
      azkarNames.where((element) => element.contains(query)).toList();
}
// this run when find the first element
// List<String>? searchAboutZikr({required String query}) {
//   for (int i = 0; i < sectionName.length; i++) {
//     if (sectionName[i].contains(query)) {
//       return sectionName.toList();
//     }
//   }
//   return null;
// }

Future<List<Hadith>> loadHadithList() async {
  String jsonString = await rootBundle.loadString('assets/darimi.json');
  List<dynamic> hadithList = json.decode(jsonString);
  List<Hadith> filteredHadithList =
      hadithList.map((item) => Hadith.fromJson(item)).toList();
  return filteredHadithList;
}

Future<List<Surah>> surahName() async {
  final response = await rootBundle.loadString('assets/data/list-surah.json');
  final List<dynamic> listData = json.decode(response);
  final List<Surah> surahList =
      listData.map((e) => Surah.fromJson(e as Map<String, dynamic>)).toList();
  return surahList;
}

String removeDiacritics(String input) {
  return input.replaceAll(RegExp(r'[\u064B-\u065F\u0670\u0674\u06D4]'), '');
}

// String removeSpaces(String input) {
//   return input.replaceAll(' ', ''); // Replace spaces with an empty string
// }

List<Map<String, dynamic>> searchResults = [];
void searchContent(String searchTerm) {
  searchResults = [];
  final normalizedSearchTerm = removeDiacritics(searchTerm.trim());
  for (var surah in Sowar.sowar['sowar']!) {
    for (var verse in surah['verses']) {
      final normalizedContent =
          removeDiacritics(verse['content'].toString().trim());
      if (normalizedContent
          // .replaceAll(RegExp(String.fromCharCodes(arabicTashkelChar)), "")
          .contains(normalizedSearchTerm)) {
        searchResults.add({
          'surah': surah['name'],
          'verseNumber': verse['verse_number'],
          'content': verse['content'],
        });
        print(
            'Found in Surah: ${surah['name']}, Verse ${verse['verse_number']}');
        print('Content: ${verse['content']}');
      }
    }
  }
}

const Iterable<int> arabicTashkelChar = [
  1617,
  124,
  1614,
  124,
  1611,
  124,
  1615,
  124,
  1612,
  124,
  1616,
  124,
  1613,
  124,
  1618,
  625,
  627,
  655,
];
