import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tvmazeflutter/constants/Config.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';
import 'package:tvmazeflutter/views/show/ShowSeassons.dart';
import 'package:tvmazeflutter/views/favourite/AddFavourite.dart';

class ShowFind extends StatefulWidget {
  const ShowFind({Key? key}) : super(key: key);

  @override
  _ShowFindState createState() => _ShowFindState();
}

class _ShowFindState extends State<ShowFind> {
  _getImage(show) {
    if (show["image"] != null && show["image"]["original"] != null) {
      return show["image"]["original"];
    }
    return "https://via.placeholder.com/680x1000";
  }

  @override
  Widget build(BuildContext context) {
    final show = ModalRoute.of(context)?.settings.arguments as Map;
    return Pages(
      title: "${show["name"]}",
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
            child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: _getImage(show),
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: _details(show),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height - 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            color: Config.COLORPRIMARY,
                            child: Text("Press for view Details"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _details(show) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(children: [Html(data: show["summary"] ?? "")]),
          Wrap(children: [
            ...show["genres"].map((e) => Chip(label: Text(e))).toList()
          ]),
          SizedBox(height: 16),
          AddFavourite(show: show),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 10),
              Text("Schedule Time:"),
              SizedBox(width: 10),
              Text(show["schedule"]["time"] ?? ""),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Text("Schedule Days:"),
              SizedBox(width: 10),
              ...show["schedule"]["days"].map((e) => Text(e)).toList(),
            ],
          ),
          SizedBox(height: 16),
          ShowSeassons(id: show["id"]),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
