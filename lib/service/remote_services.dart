
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

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
}
