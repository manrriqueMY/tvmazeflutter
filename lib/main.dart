import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tvmazeflutter/constants/Config.dart';
import 'package:tvmazeflutter/constants/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter("tvmaze");
  await Hive.openBox('tvmaze');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Config.COLORPRIMARY),
      initialRoute: "/",
      routes: Routes.paths(context),
    );
  }
}
