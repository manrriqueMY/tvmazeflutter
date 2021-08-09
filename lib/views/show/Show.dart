import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/widget/SearchField.dart';
import 'package:tvmazeflutter/widget/ShowCard.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';
import 'package:tvmazeflutter/services/IShows.dart';
import 'package:tvmazeflutter/services/local/LocalShows.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  List shows = [];
  bool loading = true;
  LocalShows localshows = new LocalShows();

  @override
  void initState() {
    _initdata();
    super.initState();
  }

  _calculeWidth(context) {
    var screen = MediaQuery.of(context).size;
    if (screen.width > 600) {
      return 200.0;
    }
    return (screen.width / 2);
  }

  _initdata() async {
    var list =
        localshows.shows.length == 0 ? await IShows.list() : localshows.shows;
    localshows.shows = list;
    setState(() {
      shows = list;
      loading = false;
    });
  }

  _searchdata(search) async {
    if (search != "") {
      setState(() {
        loading = true;
      });

      var list = await IShows.search(search);
      list = list.map((e) => e["show"]).toList();

      setState(() {
        shows = list;
        loading = false;
      });
    } else {
      _initdata();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Pages(
        title: "All Shows",
        child: Column(
          children: [
            SearchField(onChanged: (e) => _searchdata(e)),
            loading
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : Wrap(
                    children: shows
                        .map((show) =>
                            ShowCard(show: show, width: _calculeWidth(context)))
                        .toList(),
                  ),
          ],
        ));
  }
}
