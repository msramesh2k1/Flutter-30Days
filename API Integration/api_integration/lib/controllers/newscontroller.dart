import 'dart:convert';

import 'package:api_integration/constants/constants.dart';
import 'package:api_integration/models/newsmodel.dart';
import 'package:api_integration/services/api_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_connect.dart';

class NewsController extends GetxController {
  // ignore: deprecated_member_use
  List<Article> article = <Article>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchnews();
    super.onInit();
  }

  fetchnews() async {
    article = await APIService().newsdata();
    update();
  }
}
