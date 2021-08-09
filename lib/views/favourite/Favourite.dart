import 'package:flutter/cupertino.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';
import 'package:tvmazeflutter/services/local/FavouriteShows.dart';
import 'package:tvmazeflutter/widget/ShowCard.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List shows = [];
  FavouriteShows favouriteshows = new FavouriteShows();

  @override
  void initState() {
    _initdata();
    super.initState();
  }

  _initdata() {
    var list = favouriteshows.shows;
    setState(() {
      shows = list;
    });
  }

  _calculeWidth(context) {
    var screen = MediaQuery.of(context).size;
    if (screen.width > 600) {
      return 200.0;
    }
    return (screen.width / 2);
  }

  @override
  Widget build(BuildContext context) {
    return Pages(
        child: Wrap(
          children: shows
              .map(
                  (show) => ShowCard(show: show, width: _calculeWidth(context)))
              .toList(),
        ),
        title: "Favourite Shows");
  }
}
