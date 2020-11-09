import 'package:dio/dio.dart';

class Application {
  static Application _instance;
  Dio dioWikiApi;
  Application({this.dioWikiApi});

  static Future<Application> get instance async {
    return await Application()._getInstance();
  }

  Future<Application> _getInstance() async {
    if (_instance == null) {
      dioWikiApi = Dio();

      //NewsApi Dio
      dioWikiApi.options
        ..baseUrl = "https://newsapi.org"
        ..contentType = "application/json"
        ..headers = {
          "Authorization": "Bearer ",
        };
    }

    return _instance;
  }
}
