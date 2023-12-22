import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:provider/provider.dart';
import 'package:quran/providers/book_mark.dart';

class PDFViewerFromAsset extends StatelessWidget {
  PDFViewerFromAsset({Key? key, required this.pdfAssetPath, required this.page})
      : super(key: key);
  final String pdfAssetPath;
  final int page;
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
      StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: const Text('PDF From Asset'),
          actions: [
            Consumer<BookMarkProvider>(
              builder: (BuildContext context, bookmarkProvider, Widget? child) {
                return IconButton(
                  icon: Icon(
                    bookmarkProvider.isBookmarked(page)
                        ? Icons.bookmark
                        : Icons.bookmark_outline_rounded,
                  ),
                  onPressed: () {
                    bookmarkProvider.toggleBookmark(
                        page); // Call onBookMark with the specific page number
                  },
                );
              },
            )
          ],
        ),
        body: PDF(
          enableSwipe: true,
          defaultPage: page,
          swipeHorizontal: true,
          autoSpacing: false,
          fitEachPage: true,
          // pageSnap: false,
          pageFling: true,
          fitPolicy: FitPolicy.BOTH,
          onPageChanged: (int? current, int? total) =>
              _pageCountController.add('${current! + 1} - $total'),
          onViewCreated: (PDFViewController pdfViewController) async {
            _pdfViewController.complete(pdfViewController);
            final int currentPage =
                await pdfViewController.getCurrentPage() ?? 0;
            final int? pageCount = await pdfViewController.getPageCount();
            _pageCountController.add('${currentPage + 1} - $pageCount');
          },
        ).fromAsset(
          pdfAssetPath,
          errorWidget: (dynamic error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
