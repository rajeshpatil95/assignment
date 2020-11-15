import 'dart:convert';
import 'package:assignment/app.dart';
import 'package:assignment/events/wiki.dart';
import 'package:assignment/models/wiki.dart';
import 'package:assignment/services/client/wiki.dart';
import 'package:assignment/utils/sp_util.dart';
import 'package:bloc/bloc.dart';
import 'package:assignment/states/common_state.dart';
import 'package:rxdart/rxdart.dart';

class WikiBloc extends Bloc<WikiEvent, CommonAppStates> {
  final WikiApiClient wikiApiClient;
  WikiBloc({this.wikiApiClient});

  WikiModel wikiModelTopHeadings, wikiModelEverything;

  CommonAppStates fetchTopHeadlinesState, fetchEverythingState;

  String topicDescription = "";

  @override
  CommonAppStates get initialState => Initial();

  @override
  Stream<CommonAppStates> mapEventToState(event) async* {
    //1----Fetch Top Headlines
    if (event is FetchTopHeadlinesEventDispatched) {
      yield fetchTopHeadlinesState = Loading();
      try {
        final response = await wikiApiClient.fetchTopHeadlines(
            context: event.context,
            searchText: event.searchText,
            limit: event.limit);

        this.wikiModelTopHeadings = WikiModel.fromJson(response.data);

        application.spUtil.saveLastSearchValue(event.searchText);
        application.spUtil.saveSearchData(jsonEncode(response.data));

        if (response.statusCode == 200) {
          yield fetchTopHeadlinesState = Success();
        }
      } catch (e) {
        yield fetchTopHeadlinesState =
            Failed(errorMsg: "Wiki TopHeadings api failed..!!");
      }
    }

    //2----Fetch Everything
    else if (event is FetchEverythingEventDispatched) {
      yield fetchEverythingState = Loading();
      try {
        final response = await wikiApiClient.fetchEverything(
            context: event.context,
            searchText: event.searchText,
            limit: event.limit);

        Map<String, dynamic> jsonData = response.data['query']['pages'];
        String pageId = jsonData.keys.toList()[
            0]; // 0 for first page, you can iterate for multiple pages
        var firstPage = jsonData[pageId];
        topicDescription = firstPage["extract"];

        if (response.statusCode == 200) {
          yield fetchEverythingState = Success();
        }
      } catch (e) {
        print("FetchEverythingEventDispatched Exception: ${e}");
        yield fetchEverythingState =
            Failed(errorMsg: "Wiki TopHeadings api failed..!!");
      }
    }
  }

  @override
  Stream<CommonAppStates> transformEvents(Stream<WikiEvent> events,
          Stream<CommonAppStates> Function(WikiEvent p1) next) =>
      events.switchMap(next);
}
