import 'package:flutter_test/flutter_test.dart';
import 'package:project/apiservice/api_service.dart';
import 'package:project/models/nyk_model.dart';

class ApiIntegrationTesting {
  void testApiRequest() {
    test("testing the result object is fulfilled......", () async {
      var result = await ApiService.fetchData();
      expect(result.runtimeType, NYKModel);
    });
  }

  void testRequestIsEmpty() {
    test("testing if the result is empty or not", () async {
      var result = await ApiService.fetchData();
      expect(result.results!.isEmpty, false);
    });
  }
}
