import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/models/nyk_model.dart';

class ApiService {
  static Future<NYKModel> fetchData() async {
    NYKModel nykModel = NYKModel();
    try {
      final response = await http.get(Uri.parse(
          'http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=rjL9vJMrQtw6SXxMiUdEyn3igDJHE5xp'));

      if (response.statusCode == 200) {
        nykModel = NYKModel.fromJson(json.decode(response.body));
        print(nykModel.results);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return nykModel;
  }
}
