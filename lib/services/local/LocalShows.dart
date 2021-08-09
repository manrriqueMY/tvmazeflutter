import 'package:hive/hive.dart';

class LocalShows {
  var box = Hive.box('tvmaze');

  List get shows => box.get("shows") ?? [];
  set shows(shows) => box.put("shows", shows);
}
