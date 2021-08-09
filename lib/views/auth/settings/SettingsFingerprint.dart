import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';
import 'package:tvmazeflutter/services/local/SavedFinger.dart';

class SettingsFingerprint extends StatefulWidget {
  const SettingsFingerprint({Key? key}) : super(key: key);

  @override
  _SettingsFingerprintState createState() => _SettingsFingerprintState();
}

class _SettingsFingerprintState extends State<SettingsFingerprint> {
  SavedFinger savedfinger = new SavedFinger();
  bool usefinger = false;

  @override
  void initState() {
    initdata();
    super.initState();
  }

  initdata() {
    setState(() {
      usefinger = savedfinger.usefinger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Pages(
      title: "Configure PIN",
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text("Use FINGERPRINT"),
              ),
              Switch(
                value: usefinger,
                onChanged: (e) {
                  savedfinger.usefinger = e;
                  setState(() {
                    usefinger = savedfinger.usefinger;
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
