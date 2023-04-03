import 'package:flutter/cupertino.dart';
import 'package:project/apiservice/api_service.dart';
import 'package:project/models/nyk_model.dart';

class HomePageController extends ChangeNotifier {
  NYKModel nykModel = NYKModel();
  bool loading = true;

  void fetch() async {
    nykModel = await ApiService.fetchData();
    loading = false;
    notifyListeners();
  }

  String cutString(String string) {
    if (string.length > 30) {
      for (var i = 30; i <= string.length; i++) {
        if (i == 31 || i == 32 || i == 33) {
          string.replaceRange(i, i, ".");
        } else {
          string.replaceRange(i, i, " ");
        }
      }
    }

    notifyListeners();
    return string.trim();
  }
}
