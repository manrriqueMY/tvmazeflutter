import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tvmazeflutter/constants/Config.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';
import 'package:tvmazeflutter/widget/CastCredit.dart';

class Person extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  _getImage(person) {
    if (person["image"] != null && person["image"]["original"] != null) {
      return person["image"]["original"];
    }
    return "https://via.placeholder.com/680x1000";
  }

  @override
  Widget build(BuildContext context) {
    final person = ModalRoute.of(context)?.settings.arguments as Map;
    return Pages(
      title: person["name"],
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
            child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: _getImage(person),
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: _details(person),
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

  _details(person) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: [SizedBox(height: 16), CastCredit(id: person["id"])],
      ),
    );
  }
}
