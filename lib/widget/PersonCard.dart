import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/widget/CardItem.dart';

class PersonCard extends StatelessWidget {
  final person;
  final width;
  PersonCard({this.person, this.width});

  _getImage(show) {
    if (show["image"] != null && show["image"]["medium"] != null) {
      return show["image"]["medium"];
    }
    return "https://via.placeholder.com/215x295";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      child: _ongesture(context),
    );
  }

  _ongesture(context) {
    return InkWell(
      onTap: () {
        //print(widget.person["id"]);
        Navigator.pushNamed(context, "/persons/find", arguments: person);
      },
      child: Stack(
        children: [
          CardItem(image: _getImage(person), name: person["name"]),
        ],
      ),
    );
  }
}
