import 'package:hive/hive.dart';

class SavedPin {
  var box = Hive.box('tvmaze');

  String get pin => box.get("pin") ?? "1111";
  set pin(pin) => box.put("pin", pin);

  bool get usepin => box.get("usepin") ?? false;
  set usepin(usepin) => box.put("usepin", usepin);
}
