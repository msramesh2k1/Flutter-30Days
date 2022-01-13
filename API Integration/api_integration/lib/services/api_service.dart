import 'package:api_integration/constants/constants.dart';
import 'package:http/http.dart' as http;

class APIService {
  void getnews() async {
    var client = http.Client();

    var response = await client.get(Uri.parse(APIConstansts.url));

    if (response.statusCode == 200) {
      var data = response.body;
      
    }
  }
}
