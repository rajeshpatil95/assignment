import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NewsEvent extends Equatable {
  NewsEvent([List props = const []]) : super(props);
}

class FetchTopHeadlinesEventDispatched extends NewsEvent {
  BuildContext context;
  FetchTopHeadlinesEventDispatched({this.context});
  @override
  String toString() => 'FetchTopHeadlinesEventDispatched';
}

class FetchEverythingEventDispatched extends NewsEvent {
  BuildContext context;
  FetchEverythingEventDispatched({this.context});
  @override
  String toString() => 'FetchEverythingEventDispatched';
}
