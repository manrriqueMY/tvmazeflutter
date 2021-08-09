import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/layouts/App.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('lib/assets/documents/doc.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return App(
      currentIndex: 0,
      onTap: _onTap,
      child: Column(
        children: [
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 130,
                  child: PDFViewer(
                    scrollDirection: Axis.vertical,
                    document: document,
                    zoomSteps: 1,
                  ),
                ),
        ],
      ),
    );
  }

  _onTap(e) {
    switch (e) {
      case 0:
        Navigator.pushNamed(context, "/show");
        break;
      case 1:
        Navigator.pushNamed(context, "/favourite");
        break;
      case 2:
        Navigator.pushNamed(context, "/settings");
        break;
      default:
      //
    }
  }
}
