import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferences? prefs;

  Future getSharedPreferencesInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  // store boolean preference data
  Future storeBoolPrefData(String key, bool res) async {
    await prefs!.setBool(key, res);
  }

  // store string preference data
  Future storePrefData(String key, String res) async {
    await prefs!.setString(key, res);
  }

  // store double preference data
  Future storePrefDataDouble(String key, double res) async {
    await prefs!.setDouble(key, res);
  }

  // store Int preference data
  Future storePrefDataInt(String key, int res) async {
    await prefs!.setInt(key, res);
  }

  // retrieve double preference data
  Future<double> retrievePrefDataDouble(String key) async {
    double str = prefs!.getDouble(key) ?? 0.0;
    return str;
  }

  // retrieve double preference data
  Future<int> retrievePrefDataInt(String key) async {
    int str = prefs?.getInt(key) ?? 0;
    return str;
  }

  // retrieve string preference data
  Future<String> retrievePrefData(String key) async {
    String str = prefs!.getString(key) ?? '';
    return str;
  }

  // retrieve bool preference data
  Future<bool> retrievePrefBoolData(String key) async {
    return prefs!.getBool(key) ?? false;
  }

  // clear all preference data
  Future clearPrefData() async {
    await prefs!.clear();
  }
}

SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
