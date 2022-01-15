import 'dart:convert';

import 'package:api_integration/constants/constants.dart';
import 'package:api_integration/models/newsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class APIService with ChangeNotifier {
 Future<List<Article>> fetchnews() async {
     var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
      // Map<String, dynamic> json = jsonDecode(response.body);
     var json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> article =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return article;
    } else { 
      throw ("Cant get the Artcile");
    }
  }
}



