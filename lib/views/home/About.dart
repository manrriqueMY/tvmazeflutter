import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Pages(
      title: "Manrrique MY",
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("TVMAZE APP"),
              ],
            ),
            SizedBox(height: 16),
            Text("Manrrique MENESES YARANGA", textAlign: TextAlign.left),
            Text("manrrique.my@gmail.com", textAlign: TextAlign.left),
            Text("+51 910103845 (UTC-5)", textAlign: TextAlign.left),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("http: HTTP request data", textAlign: TextAlign.left),
                    Text("cached_network_image: Async load Image",
                        textAlign: TextAlign.left),
                    Text("hive: NoSQL, altenative to SQLite, SharedPreferences",
                        textAlign: TextAlign.left),
                    Text("hive_flutter: Hive adapter",
                        textAlign: TextAlign.left),
                    Text("modal_bottom_sheet: Modal dismisable",
                        textAlign: TextAlign.left),
                    Text("flutter_html: HTML interprete",
                        textAlign: TextAlign.left),
                    Text("pin_code_fields: Pin code fields",
                        textAlign: TextAlign.left),
                    Text("local_auth: Accesible auth to phone, FINGERPRINT",
                        textAlign: TextAlign.left),
                    Text("flutter_native_splash: Splash Screen",
                        textAlign: TextAlign.left),
                    Text("advance_pdf_viewer: PDF Preview",
                        textAlign: TextAlign.left),
                    SizedBox(height: 16),
                    Text("Android Challenge https://www.tvmaze.com/",
                        textAlign: TextAlign.left),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
