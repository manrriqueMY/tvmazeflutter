import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';
import 'package:tvmazeflutter/services/IShows.dart';
import 'package:tvmazeflutter/widget/PersonCard.dart';
import 'package:tvmazeflutter/widget/SearchField.dart';

class ShowPersons extends StatefulWidget {
  const ShowPersons({Key? key}) : super(key: key);

  @override
  _ShowPersonsState createState() => _ShowPersonsState();
}

class _ShowPersonsState extends State<ShowPersons> {
  List actors = [];
  bool loading = false;

  _calculeWidth(context) {
    var screen = MediaQuery.of(context).size;
    if (screen.width > 600) {
      return 200.0;
    }
    return (screen.width / 2);
  }

  _searchactors(e) async {
    setState(() {
      loading = true;
    });
    var list = await IShows.persons(e);
    list = list.map((persons) => persons["person"]).toList();
    setState(() {
      loading = false;
      actors = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Pages(
      title: "Search Actors",
      child: Column(
        children: [
          SearchField(onChanged: _searchactors),
          loading
              ? Center(child: LinearProgressIndicator())
              : Wrap(
                  children: actors
                      .map((e) =>
                          PersonCard(person: e, width: _calculeWidth(context)))
                      .toList(),
                )
        ],
      ),
    );
  }
}
