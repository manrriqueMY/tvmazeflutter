import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/services/IShows.dart';
import 'package:tvmazeflutter/widget/ShowCard.dart';

class CharactersItem extends StatefulWidget {
  final uri;
  const CharactersItem({this.uri});

  @override
  _CharactersItemState createState() => _CharactersItemState();
}

class _CharactersItemState extends State<CharactersItem> {
  bool loading = true;
  var show;
  _calculeWidth(context) {
    var screen = MediaQuery.of(context).size;
    if (screen.width > 600) {
      return 200.0;
    }
    return (screen.width / 2) - 10;
  }

  @override
  void initState() {
    initdata();
    super.initState();
  }

  initdata() async {
    List txt = widget.uri.toString().split("/");
    var shw = await IShows.show(txt.last);
    setState(() {
      show = shw;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            child: Column(
              children: [
                SizedBox(height: 16),
                LinearProgressIndicator(),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        : ShowCard(
            show: show,
            width: _calculeWidth(context),
          );
  }
}
