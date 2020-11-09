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

      //WikiApi Dio
      dioWikiApi.options
        ..baseUrl = "https://en.wikipedia.org"
        ..contentType = "application/json"
        ..headers = {
          "Authorization": "Bearer ",
        };
    }

    return _instance;
  }
}
