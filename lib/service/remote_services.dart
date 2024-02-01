import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'apis.dart';

class RemoteServices {
  static var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );
  static var client = http.Client();

  /*Printing Response of API's in Terminal*/
  static void printResponse(
      Map<String, String> header, dynamic body, http.Response response) {
    logger.d('Header: $header');
    logger.d('Body : $body');
    logger.i('URL: ${response.request!.url}');
    logger.i('Response status: ${response.statusCode}');
    logger.i('Response body: ${response.body}');
  }

  static Future<http.Response> getCurrency(int start, int limit) async {
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      'X-CMC_PRO_API_KEY': Apis.apiKey
    };
    http.Response response = await http.get(
        Uri.parse(
            "${Apis.baseUrl}${Apis.cryptoCurrency}?start=$start&limit=$limit&sort=id"),
        headers: header);
    printResponse(header, null, response);
    return response;
  }
}
