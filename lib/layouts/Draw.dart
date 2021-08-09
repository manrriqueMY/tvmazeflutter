import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ListTile(
              onTap: () {
                _redirect(context, "/persons");
              },
              title: Text("Find Actors"),
              leading: Icon(Icons.person)),
          ListTile(
              onTap: () {
                _redirect(context, "/show");
              },
              title: Text("Find Shows"),
              leading: Icon(Icons.video_call)),
          ListTile(
            onTap: () {
              _redirect(context, "/favourite");
            },
            title: Text("Find Favourites"),
            leading: Icon(Icons.star),
          ),
          ListTile(
            onTap: () {
              _redirect(context, "/settings");
            },
            title: Text("Setting"),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            onTap: () {
              _redirect(context, "/about");
            },
            title: Text("About"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            onTap: () {
              SystemNavigator.pop();
            },
            title: Text("Exit"),
            leading: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }

  _redirect(context, route) {
    Navigator.pushNamed(context, route);
  }
}
