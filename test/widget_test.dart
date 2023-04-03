// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/apiservice/api_service.dart';
import 'package:project/controllers/homepage_controller.dart';

import 'package:project/main.dart';
import 'package:project/models/nyk_model.dart';
import 'package:project/views/details_pageview.dart';
import 'package:project/views/home_pageview.dart';
import 'package:provider/provider.dart';

import 'api_integration_testing/api_integration_test.dart';
import 'widget_testing/app_widget_test.dart';

void main() {
  group("testing NewYorkTimes ApiService request", () {
    ApiIntegrationTesting().testApiRequest();
    ApiIntegrationTesting().testRequestIsEmpty();
  });
  testWidgets("testing widgets", ((widgetTester) async {
    await widgetTester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) {
            return HomePageController();
          }),
        )
      ],
      child: MyApp(),
    ));
    expect(find.text("NY Times Most Popular"), findsOneWidget);

    // await widgetTester.tap(find.byType(IconButton));
    // await widgetTester.pump();
    // var title = find.text("New York Times");
    // expect(title, findsOneWidget);
  }));
}
