import 'package:hive/hive.dart';

class SavedFinger {
  var box = Hive.box('tvmaze');

  bool get usefinger => box.get("usefinger") ?? false;
  set usefinger(usefinger) => box.put("usefinger", usefinger);
}
