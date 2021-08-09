import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';
import 'package:tvmazeflutter/services/local/SavedPin.dart';

class SettingsPin extends StatefulWidget {
  const SettingsPin({Key? key}) : super(key: key);

  @override
  _SettingsPinState createState() => _SettingsPinState();
}

class _SettingsPinState extends State<SettingsPin> {
  SavedPin savedpin = new SavedPin();
  bool usepin = false;
  String pin = "";
  bool complete = false;

  @override
  void initState() {
    initdata();
    super.initState();
  }

  initdata() {
    setState(() {
      usepin = savedpin.usepin;
      pin = savedpin.pin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Pages(
      title: "Configure PIN",
      child: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("Your PIN: " + savedpin.pin),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text("Use PIN"),
              ),
              Switch(
                value: usepin,
                onChanged: (e) {
                  savedpin.usepin = e;
                  setState(() {
                    usepin = savedpin.usepin;
                  });
                },
              )
            ],
          ),
          usepin
              ? Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: PinCodeTextField(
                    length: 4,
                    onChanged: (e) {
                      setState(() {
                        pin = e;
                        complete = e.length == 4;
                      });
                    },
                    appContext: context,
                  ),
                )
              : Container(),
          usepin && complete
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        savedpin.pin = pin;
                        initdata();
                      },
                      child: Text("Save"),
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
