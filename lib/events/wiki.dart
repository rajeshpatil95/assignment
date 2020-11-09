import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WikiEvent extends Equatable {
  WikiEvent([List props = const []]) : super(props);
}

class FetchTopHeadlinesEventDispatched extends WikiEvent {
  BuildContext context;
  String searchText;
  int limit;
  FetchTopHeadlinesEventDispatched({this.context, this.searchText, this.limit});
  @override
  String toString() => 'FetchTopHeadlinesEventDispatched';
}

class FetchEverythingEventDispatched extends WikiEvent {
  BuildContext context;
  String searchText;
  int limit;
  FetchEverythingEventDispatched({this.context, this.searchText, this.limit});
  @override
  String toString() => 'FetchEverythingEventDispatched';
}
