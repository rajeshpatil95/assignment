import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NewsEvent extends Equatable {
  NewsEvent([List props = const []]) : super(props);
}

class FetchTopHeadlinesEventDispatched extends NewsEvent {
  BuildContext context;
  String searchText;
  int limit;
  FetchTopHeadlinesEventDispatched({this.context, this.searchText, this.limit});
  @override
  String toString() => 'FetchTopHeadlinesEventDispatched';
}

class FetchEverythingEventDispatched extends NewsEvent {
  BuildContext context;
  String searchText;
  int limit;
  FetchEverythingEventDispatched({this.context, this.searchText, this.limit});
  @override
  String toString() => 'FetchEverythingEventDispatched';
}
