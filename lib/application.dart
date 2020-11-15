import 'package:assignment/utils/sp_util.dart';
import 'package:dio/dio.dart';

class Application {
  static Application _instance;
  SpUtil spUtil;
  Dio dioWikiApi;
  Application({this.dioWikiApi, this.spUtil});

  static Future<Application> get instance async {
    return await Application()._getInstance();
  }

  Future<Application> _getInstance() async {
    if (_instance == null) {
      dioWikiApi = Dio();
      spUtil = await SpUtil.getInstance();

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
