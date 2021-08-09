import 'package:tvmazeflutter/services/Fetch.dart';

class IShows {
  static list() => Fetch.get(path: "/shows") ?? [];
  static search(search) =>
      Fetch.get(path: "/search/shows", params: {"q": search}) ?? [];
  static seasons(showid) => Fetch.get(path: "/shows/$showid/seasons") ?? [];
  static episodes(seasonid) =>
      Fetch.get(path: "/seasons/$seasonid/episodes") ?? [];
  static episode(episodeid) => Fetch.get(path: "/episodes/$episodeid");

  static persons(search) =>
      Fetch.get(path: "/search/people", params: {"q": search});
  static person(personid) => Fetch.get(path: "/people/$personid/castcredits");
  static show(showid) => Fetch.get(path: "/shows/$showid");
}
