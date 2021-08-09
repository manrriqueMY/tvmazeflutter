import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';

class EpisodeCard extends StatefulWidget {
  const EpisodeCard({Key? key}) : super(key: key);

  @override
  _EpisodeCardState createState() => _EpisodeCardState();
}

class _EpisodeCardState extends State<EpisodeCard> {
  _getImage(episode) {
    if (episode["image"] != null && episode["image"]["original"] != null) {
      return episode["image"]["original"];
    }
    return "https://via.placeholder.com/1280x720";
  }

  @override
  Widget build(BuildContext context) {
    final episode = ModalRoute.of(context)?.settings.arguments as Map;
    return Pages(
      title: episode["name"],
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(children: [
            SizedBox(width: 10),
            Text("Episode: "),
            Text("${episode["number"]}")
          ]),
          Row(children: [
            SizedBox(width: 10),
            Text("Season: "),
            Text("${episode["season"]}")
          ]),
          Html(data: episode["summary"] ?? ""),
          CachedNetworkImage(
            imageUrl: _getImage(episode),
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
