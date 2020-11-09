import 'package:assignment/api/api.dart';
import 'package:assignment/constants/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WikiApiClient {
  final Dio dioWikiApi;
  WikiApiClient({this.dioWikiApi});

  Future<Response> fetchTopHeadlines({BuildContext context, String searchText, int limit}) async {
    Response response;
    try {
      response = await dioWikiApi.get(Api.TOP_HEADLINES(searchText, limit));
    } on DioError catch (e) {
      response = e.response;
      throw e;
    }
    return response;
  }

  Future<Response> fetchEverything({BuildContext context, String searchText, int limit}) async {
    Response response;

    try {
      response = await dioWikiApi.get(Api.EVERYTHING(searchText, limit));
    } on DioError catch (e) {
      response = e.response;
      throw e;
    }
    return response;
  }
}
