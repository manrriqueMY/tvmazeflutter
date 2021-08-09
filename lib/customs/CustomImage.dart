import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final width;
  final imgSrc;
  CustomImage({this.width, this.imgSrc});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      imageUrl: imgSrc,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
