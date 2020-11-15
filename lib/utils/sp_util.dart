import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SpUtil _instance;
  static Future<SpUtil> get instance async {
    return await getInstance();
  }

  static SharedPreferences _spf;

  SpUtil._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<SpUtil> getInstance() async {
    if (_instance == null) {
      _instance = new SpUtil._();
      await _instance._init();
    }
    return _instance;
  }

  static bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  Future<bool> saveSearchData(String value) {
    if (_beforeCheck()) return null;
    return _spf.setString('search_data', value);
  }

  String get getSearchData {
    if (_beforeCheck()) return null;
    return _spf.getString('search_data');
  }

  Future<bool> saveLastSearchValue(String value) {
    if (_beforeCheck()) return null;
    return _spf.setString('last_search_value', value);
  }

  String get lastSearchValue {
    if (_beforeCheck()) return null;
    return _spf.getString('last_search_value');
  }
}
