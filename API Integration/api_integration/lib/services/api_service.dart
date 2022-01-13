import 'dart:convert';

import 'package:api_integration/constants/constants.dart';
import 'package:api_integration/models/news_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<NewsModelApi> getnews() async {
    var client = http.Client();
    var NewsModelFinal = null;

    var response = await client.get(Uri.parse(APIConstansts.url));

    if (response.statusCode == 200) {
      var data = response.body;
      var datadecode = jsonDecode(data);

      NewsModelFinal = newsModelApiFromJson(datadecode);
    }

    return NewsModelFinal;
  }
}
