import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tvmazeflutter/layouts/Pages.dart';
import 'package:tvmazeflutter/services/local/SavedFinger.dart';
import 'package:tvmazeflutter/services/local/SavedPin.dart';

class Initial extends StatefulWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  LocalAuthentication auth = LocalAuthentication();
  SavedFinger savedfinger = new SavedFinger();
  SavedPin savedpin = new SavedPin();
  String pin = "";
  bool complete = false;
  String message = "";

  @override
  void initState() {
    new Timer(Duration(seconds: 1), _validAuth);
    super.initState();
  }

  _gotoHome() {
    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
  }

  _validAuth() async {
    if (!savedfinger.usefinger && !savedpin.usepin) {
      Timer(Duration(seconds: 1), () => _gotoHome());
    }
    if (savedfinger.usefinger) {
      bool authenticated = false;
      try {
        authenticated = await auth.authenticate(
            localizedReason: 'Let OS determine authentication method',
            useErrorDialogs: true,
            stickyAuth: true);
      } on PlatformException catch (e) {
        authenticated = false;
      }
      if (authenticated) {
        _gotoHome();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return savedfinger.usefinger || savedpin.usepin
        ? _authpage()
        : Container(
            child: Image.asset("lib/assets/images/splash.png"),
          );
  }

  _authpage() {
    return Pages(
      title: "Auth",
      child: savedpin.usepin
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Enter Your Pin")],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, right: 32),
                  child: PinCodeTextField(
                    length: 4,
                    onChanged: (e) {
                      setState(() {
                        pin = e;
                        complete = e.length == 4;
                        message = "";
                      });
                    },
                    appContext: context,
                  ),
                ),
                complete
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (savedpin.pin == pin) {
                                _gotoHome();
                              } else {
                                setState(() {
                                  message = "PIN is Incorrect";
                                });
                              }
                            },
                            child: Text("Access"),
                          )
                        ],
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(message)],
                ),
              ],
            )
          : Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _validAuth,
                    child: Icon(Icons.fingerprint_outlined),
                  )
                ],
              ),
            ),
    );
  }
}
