import 'package:assignment/routers/page_transition.dart';
import 'package:assignment/views/searchNews/search_description_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const root = '/';
  static const searchDescriptionPage = '/searchDescriptionPage';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case searchDescriptionPage:
        return PageTransitionBuilder(
            widget: SearchDescriptionPage(
          page: settings.arguments,
        ));
        break;

      default:
        return PageTransitionBuilder(
            transitionType: TransitionType.botttomToTop, widget: Container());
    }
  }
}
