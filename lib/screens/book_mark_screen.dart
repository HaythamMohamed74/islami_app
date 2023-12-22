import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_assets.dart';
import '../providers/book_mark.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});
  // final BookMarkProvider bookmarkProvider;
  @override
  Widget build(BuildContext context) {
    final BookMarkProvider bookmarkProvider =
        Provider.of<BookMarkProvider>(context);
    return Scaffold(
        body: PDF(
      enableSwipe: true,
      defaultPage: bookmarkProvider.bookmarkedPage,
      swipeHorizontal: true,
      autoSpacing: false,
      fitEachPage: true,
      // Other properties...
    ).fromAsset(
          AssetsData.quranPdf,
      errorWidget: (dynamic error) => Center(child: Text(error.toString())),
    ));
  }
}
