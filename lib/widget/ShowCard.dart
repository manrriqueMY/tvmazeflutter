import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/views/favourite/AddFavourite.dart';
import 'package:tvmazeflutter/widget/CardItem.dart';

class ShowCard extends StatefulWidget {
  final show;
  final width;
  ShowCard({this.show, this.width = 200.0});

  @override
  _ShowCardState createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  _getImage(show) {
    if (show["image"] != null && show["image"]["medium"] != null) {
      return show["image"]["medium"];
    }
    return "https://via.placeholder.com/215x295";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.all(10),
      child: _ongesture(),
    );
  }

  _ongesture() {
    return InkWell(
      onTap: () {
        //print(widget.show["id"]);
        Navigator.pushNamed(context, "/show/find", arguments: widget.show);
      },
      child: Stack(
        children: [
          CardItem(image: _getImage(widget.show), name: widget.show["name"]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AddFavourite(show: widget.show, seeText: false),
            ],
          )
        ],
      ),
    );
  }
}
