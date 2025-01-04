import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PdfViewer extends StatefulWidget {
  final String path;

  PdfViewer(this.path);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PdfViewer> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Is PDF " + GetUtils.isPDF(widget.path).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          "PDF Viewer",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: false,
            fitEachPage: true,
            // Set swipe direction to vertical
            autoSpacing: true,
            pageFling: false,
            pageSnap: false,
            defaultPage: currentPage ?? 0,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,

            // scrollDirection: Axis.vertical, // Enable vertical scrolling
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              setState(() {
                currentPage = page;
              });
              print('page change: $page/$total');
            },
          ),
          if (errorMessage.isNotEmpty)
            Center(
              child: Text(errorMessage),
            )
          else if (!isReady)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (isReady)
            Positioned(
              bottom: 20.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    "Page ${currentPage! + 1} of $pages",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      // floatingActionButton: FutureBuilder<PDFViewController>(
      //   future: _controller.future,
      //   builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
      //     if (snapshot.hasData && pages != null) {
      //       return FloatingActionButton.extended(
      //         label: Text("Go to ${currentPage} "),
      //         onPressed: () async {
      //           await snapshot.data!.setPage(pages! ~/ 2);
      //         },
      //       );
      //     }
      //     return Container();
      //   },
      // ),
    );
  }
}
