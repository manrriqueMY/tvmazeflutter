import 'package:tvmazeflutter/views/auth/Auth.dart';
import 'package:tvmazeflutter/views/auth/Settings.dart';
import 'package:tvmazeflutter/views/auth/settings/SettingsFingerprint.dart';
import 'package:tvmazeflutter/views/auth/settings/SettingsPin.dart';
import 'package:tvmazeflutter/views/favourite/Favourite.dart';
import 'package:tvmazeflutter/views/home/About.dart';
import 'package:tvmazeflutter/views/home/Home.dart';
import 'package:tvmazeflutter/views/home/Initial.dart';
import 'package:tvmazeflutter/views/show/Person.dart';
import 'package:tvmazeflutter/views/show/Show.dart';
import 'package:tvmazeflutter/views/show/ShowFind.dart';
import 'package:tvmazeflutter/views/show/ShowPersons.dart';
import 'package:tvmazeflutter/widget/EpisodeCard.dart';

class Routes {
  static paths(context) => {
        "/": (context) => Initial(),
        "/auth": (context) => Auth(),
        "/home": (context) => Home(),
        "/show": (context) => Show(),
        "/show/find": (context) => ShowFind(),
        "/show/episode": (context) => EpisodeCard(),
        "/favourite": (context) => Favourite(),
        "/settings": (context) => Settings(),
        "/settings/pin": (context) => SettingsPin(),
        "/settings/fingerprint": (context) => SettingsFingerprint(),
        "/persons": (context) => ShowPersons(),
        "/persons/find": (context) => Person(),
        "/about": (context) => About()
      };
}
