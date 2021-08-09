import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/constants/Config.dart';
import 'package:tvmazeflutter/customs/CustomText.dart';

class CardItem extends StatelessWidget {
  final name;
  final image;
  const CardItem({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Config.COLORPRIMARY, Config.COLORPRIMARYACCENT]),
        boxShadow: [
          BoxShadow(
            color: Config.COLORPRIMARYACCENT,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: image,
                  ),
                ),
                SizedBox(height: 5),
                CustomText(text: name),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
