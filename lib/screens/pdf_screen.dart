import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../widgets/drawer_widget.dart';

class pdfScreen extends StatelessWidget {
  final String pdfUrl;
  final String title;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  pdfScreen({required this.pdfUrl, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerScreen(),
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                _pdfViewerKey.currentState?.openBookmarkView();
              })
        ],
      ),
      body: SfPdfViewer.asset(
        pdfUrl,
        key: _pdfViewerKey,
      ),
    );
  }
}
