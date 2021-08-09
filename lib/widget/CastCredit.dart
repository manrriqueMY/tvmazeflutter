import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/services/IShows.dart';
import 'package:tvmazeflutter/widget/CharactersItem.dart';

class CastCredit extends StatefulWidget {
  final id;
  const CastCredit({this.id});

  @override
  _CastCreditState createState() => _CastCreditState();
}

class _CastCreditState extends State<CastCredit> {
  List shows = [];
  bool loading = true;

  @override
  void initState() {
    _initdata();
    super.initState();
  }

  _initdata() async {
    var list = await IShows.person(widget.id);
    list = list.map((e) => e["_links"]["show"]["href"]).toList();
    setState(() {
      loading = false;
      shows = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: loading
          ? LinearProgressIndicator()
          : Wrap(
              children: shows.map((e) => CharactersItem(uri: e)).toList(),
            ),
    );
  }
}
