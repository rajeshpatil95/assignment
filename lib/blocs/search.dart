import 'dart:convert';

import 'package:assignment/events/news.dart';
import 'package:assignment/models/news.dart';
import 'package:assignment/services/client/news.dart';
import 'package:bloc/bloc.dart';
import 'package:assignment/states/common_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<NewsEvent, CommonAppStates> {
  final NewsApiClient newsApiClient;
  SearchBloc({this.newsApiClient});

  NewsModel newsModelTopHeadings, newsModelEverything;

  CommonAppStates fetchTopHeadlinesState, fetchEverythingState;

  @override
  CommonAppStates get initialState => Initial();

  @override
  Stream<CommonAppStates> mapEventToState(event) async* {
    //1----Fetch Top Headlines
    if (event is FetchTopHeadlinesEventDispatched) {
      yield fetchTopHeadlinesState = Loading();
      try {
        final response = await newsApiClient.fetchTopHeadlines();

        this.newsModelTopHeadings = NewsModel.fromJson(response.data);

        if (response.statusCode == 200) {
          yield fetchTopHeadlinesState = Success();
        }
      } catch (e) {
        yield fetchTopHeadlinesState =
            Failed(errorMsg: "News TopHeadings api failed..!!");
      }
    }

    //2----Fetch Everything
    else if (event is FetchEverythingEventDispatched) {
      yield fetchEverythingState = Loading();
      try {
        final response = await newsApiClient.fetchEverything();

        this.newsModelEverything = NewsModel.fromJson(response.data);

        if (response.statusCode == 200) {
          yield fetchEverythingState = Success();
        }
      } catch (e) {
        yield fetchEverythingState =
            Failed(errorMsg: "News TopHeadings api failed..!!");
      }
    }
  }

  @override
  Stream<CommonAppStates> transformEvents(Stream<NewsEvent> events,
          Stream<CommonAppStates> Function(NewsEvent p1) next) =>
      events.switchMap(next);
}
