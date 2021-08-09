import 'package:hive/hive.dart';

class FavouriteShows {
  var box = Hive.box('tvmaze');

  List get shows => box.get("favourite") ?? [];
  set shows(shows) => box.put("favourite", shows);

  addfavourite(show) {
    List favourites = this.shows;
    favourites.add(show);
    this.shows = favourites;
  }

  removefavourite(show) {
    List favourites = this.shows;
    favourites.removeWhere((element) => element["id"] == show["id"]);
    this.shows = favourites;
  }

  isExist(show) {
    List favourites = this.shows;
    var item = favourites.where((element) => show["id"] == element["id"]);
    return item.length > 0;
  }
}
