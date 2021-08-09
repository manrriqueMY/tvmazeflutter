import 'package:tvmazeflutter/constants/Config.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Fetch {
  static get({String path = "", params}) async {
    var url = Uri.https(Config.URLTVMAZE, path, params);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return null;
    }
  }
}
