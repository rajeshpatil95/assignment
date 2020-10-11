import 'package:assignment/api/api.dart';
import 'package:assignment/constants/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsApiClient {
  final Dio dioNewsApi;
  NewsApiClient({this.dioNewsApi});

  Future<Response> fetchTopHeadlines({BuildContext context}) async {
    Response response;
    try {
      response = await dioNewsApi.get(Api.TOP_HEADLINES(apiKey));
    } on DioError catch (e) {
      response = e.response;
      throw e;
    }
    return response;
  }

  Future<Response> fetchEverything({BuildContext context}) async {
    Response response;

    try {
      response = await dioNewsApi.get(Api.EVERYTHING(apiKey));
    } on DioError catch (e) {
      response = e.response;
      throw e;
    }
    return response;
  }
}
