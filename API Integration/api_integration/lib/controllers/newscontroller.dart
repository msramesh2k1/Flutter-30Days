import 'dart:convert';

import 'package:api_integration/constants/constants.dart';
import 'package:api_integration/models/newsmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_connect.dart';

class NewsController extends GetxController {
  List newsdata = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchnews();
    super.onInit();
  }

  void fetchnews() async {
    var response = await http.get(Uri.parse(url));
    // var mapdata = [];
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
        
      newsdata = jsonData['articles'];
      update();
         }
  }
}
