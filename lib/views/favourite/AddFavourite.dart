import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/services/local/FavouriteShows.dart';

class AddFavourite extends StatefulWidget {
  final show;
  final seeText;
  AddFavourite({this.show, this.seeText = true});

  @override
  _AddFavouriteState createState() => _AddFavouriteState();
}

class _AddFavouriteState extends State<AddFavourite> {
  bool isExist = false;
  FavouriteShows favouriteshows = new FavouriteShows();

  @override
  void initState() {
    _initdata();
    super.initState();
  }

  _initdata() {
    setState(() {
      isExist = favouriteshows.isExist(widget.show);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          isExist
              ? favouriteshows.removefavourite(widget.show)
              : favouriteshows.addfavourite(widget.show);
          _initdata();
          final snackBar = SnackBar(
            content: Text(
                isExist ? "Added Favourite List" : "Removed Favourite List"),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Row(
          children: [
            SizedBox(width: 10),
            Icon(
              isExist ? Icons.star : Icons.star_outline_sharp,
              color: Colors.yellow[800],
            ),
            widget.seeText
                ? Text(isExist ? "Remove Favourite" : "Add Favourite")
                : Text(""),
          ],
        ),
      ),
    );
  }
}
