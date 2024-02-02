// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:trial_task/model/crypto_currency_model.dart';
import 'package:trial_task/service/remote_services.dart';

void main() {
  group('fetchCryptoCurrencyData', () {
    test('should initialize static client', () {
      // Arrange
      RemoteServices myApiService = RemoteServices();

      // Act and Assert
      expect(RemoteServices.client, isA<http.Client>());
    });

    test('returns a response if the http call completes successfully',
        () async {
      var response = await RemoteServices.getCurrency(1, 20);

      expect(response.statusCode, 200);

      //convert body to Model
      Map<String, dynamic> res = json.decode(response.body);
      var currencyData = CryptoCurrencyModel.fromJson(res);

      expect(currencyData.data != null && currencyData.data!.isNotEmpty, true);

      expect(currencyData.data!.isNotEmpty, true);
    });
  });
}
