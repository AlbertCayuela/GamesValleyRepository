import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class CompanyPdfCVScreen extends StatelessWidget {
  final String cvUrl;
  CompanyPdfCVScreen(this.cvUrl);
  Future getPdf() async {
    PDFDocument document = await PDFDocument.fromURL(cvUrl);

    return document;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getPdf(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PDFViewer(document: snapshot.data);
          } else if (snapshot.hasError) {
            return Text('snapshot has error');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
