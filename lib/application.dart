import 'package:dio/dio.dart';

class Application {
  static Application _instance;
  Dio dio, dioSalesforce, dioNewsApi;
  Application({this.dioNewsApi});

  static Future<Application> get instance async {
    return await Application()._getInstance();
  }

  Future<Application> _getInstance() async {
    if (_instance == null) {
      dio = Dio();
      dioSalesforce = Dio();
      dioNewsApi = Dio();

      //NewsApi Dio
      dioNewsApi.options
        ..baseUrl = "https://newsapi.org"
        ..contentType = "application/json"
        ..headers = {
          "Authorization": "Bearer ",
        };
    }

    return _instance;
  }
}
