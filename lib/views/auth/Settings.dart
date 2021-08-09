import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  LocalAuthentication auth = LocalAuthentication();
  bool finger = false;

  @override
  void initState() {
    initdata();
    super.initState();
  }

  initdata() async {
    bool isSupported = await auth.isDeviceSupported();
    setState(() {
      finger = isSupported;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Pages(
      title: "Settings",
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/settings/pin");
            },
            trailing: Icon(Icons.pin),
            title: Text("Use PIN"),
            enabled: true,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/settings/fingerprint");
            },
            trailing: Icon(Icons.fingerprint),
            title: Text("Use Fingerprint"),
            enabled: finger,
          )
        ],
      ),
    );
  }
}
