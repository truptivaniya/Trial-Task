import 'package:get/get.dart';

class Messages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'no_connectivity': 'There is no internet connection.',
      'login': 'Login',
      'email_validator': 'Invalid email',
      'password_validator': 'Invalid password',
      'email_title': 'Email',
      'password_title': 'Password',
    }
  };
}