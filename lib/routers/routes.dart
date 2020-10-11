import 'package:assignment/routers/page_transition.dart';
import 'package:flutter/material.dart';

class Routes {
  static const root = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return null;
        break;

      default:
        return PageTransitionBuilder(
            transitionType: TransitionType.botttomToTop, widget: Container());
    }
  }
}
