import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/customs/CustomImage.dart';
import 'package:tvmazeflutter/services/IShows.dart';
import 'package:tvmazeflutter/views/show/ShowEpisodes.dart';

class ShowSeassons extends StatefulWidget {
  final id;
  ShowSeassons({this.id});

  @override
  _ShowSeassonsState createState() => _ShowSeassonsState();
}

class _ShowSeassonsState extends State<ShowSeassons> {
  List seassons = [];
  bool loading = true;

  _getImage(sesson) {
    if (sesson["image"] != null && sesson["image"]["original"] != null) {
      return sesson["image"]["original"];
    }
    return "https://via.placeholder.com/250x140";
  }

  @override
  void initState() {
    _initdata(widget.id);
    super.initState();
  }

  _initdata(id) async {
    var list = await IShows.seasons(id);
    setState(() {
      loading = false;
      seassons = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loading
          ? LinearProgressIndicator()
          : Column(children: seassons.map((sesson) => _card(sesson)).toList()),
    );
  }

  Widget _card(sesson) {
    return ExpansionTile(
      title: SingleChildScrollView(
        child: Row(
          children: [
            CustomImage(
              width: 100.0,
              imgSrc: _getImage(sesson),
            ),
            SizedBox(width: 10),
            Text(
              "Season ${sesson['number']}: " + sesson["name"],
              textAlign: TextAlign.left,
            )
          ],
        ),
        scrollDirection: Axis.horizontal,
      ),
      children: [
        ShowEpisodes(id: sesson["id"]),
      ],
    );
  }
}
