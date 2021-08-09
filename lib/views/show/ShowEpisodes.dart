import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/customs/CustomImage.dart';
import 'package:tvmazeflutter/services/IShows.dart';

class ShowEpisodes extends StatefulWidget {
  final id;
  ShowEpisodes({this.id});

  @override
  _ShowEpisodesState createState() => _ShowEpisodesState();
}

class _ShowEpisodesState extends State<ShowEpisodes> {
  List episodes = [];
  bool loading = true;

  _getImage(sesson) {
    if (sesson["image"] != null && sesson["image"]["medium"] != null) {
      return sesson["image"]["medium"];
    }
    return "https://via.placeholder.com/250x140";
  }

  @override
  void initState() {
    _initdata(widget.id);
    super.initState();
  }

  _initdata(id) async {
    var list = await IShows.episodes(id);
    setState(() {
      loading = false;
      episodes = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loading
          ? LinearProgressIndicator()
          : Column(
              children: episodes.map((episode) => _card(episode)).toList()),
    );
  }

  Widget _card(episode) {
    return ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/show/episode", arguments: episode);
        },
        trailing: Icon(Icons.arrow_forward),
        title: SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(width: 10),
              CustomImage(
                width: 80.0,
                imgSrc: _getImage(episode),
              ),
              SizedBox(width: 10),
              Text(
                "${episode['season']}x${episode['number']}: " + episode["name"],
                textAlign: TextAlign.left,
              )
            ],
          ),
          scrollDirection: Axis.horizontal,
        ));
  }
}
