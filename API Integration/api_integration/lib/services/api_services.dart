import 'dart:convert';

import 'package:api_integration/constants/constants.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<List> fetchnews() async {
    var response = await http.get(Uri.parse(url));
    var mapdata = [];
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      mapdata = jsonData['articles'];
    }
    return (mapdata);
  }
}
