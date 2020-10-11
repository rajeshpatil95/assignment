import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TransitionType {
  fadeTransition,
  leftToRightTransition,
  scaleTransition,
  rightToLeftTransition,
  botttomToTop
}

class PageTransitionBuilder<T> extends PageRoute<T> {
  final Widget widget;
  final bool fullscreenDialog;
  final TransitionType transitionType;
  PageTransitionBuilder({
    @required this.widget,
    RouteSettings settings,
    this.transitionType = TransitionType.leftToRightTransition,
    this.fullscreenDialog = false,
  })  : assert(widget != null),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);

  @override
  bool get maintainState => true;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
    return previousRoute is MaterialPageRoute ||
        previousRoute is CupertinoPageRoute;
  }

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    // Don't perform outgoing animation if the next route is a fullscreen dialog.
    return (nextRoute is MaterialPageRoute && !nextRoute.fullscreenDialog) ||
        (nextRoute is CupertinoPageRoute && !nextRoute.fullscreenDialog);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // final Widget result = widget;
    assert(() {
      if (widget == null) {
        throw FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
            'Route builders must never return null.');
      }
      return true;
    }());
    if (Theme.of(context).platform == TargetPlatform.android) {
      return FadeTransition(
        opacity: animation,
        child: widget,
      );
    } else {
      return Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: widget,
      );
    }
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    if (transitionType == TransitionType.fadeTransition)
      return FadeTransition(
        opacity: animation,
        child: widget,
      );
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      var offset;
      if (transitionType == TransitionType.leftToRightTransition)
        offset = const Offset(-1, 0);
      else if (transitionType == TransitionType.rightToLeftTransition)
        offset = const Offset(1, 0);
      else if (transitionType == TransitionType.botttomToTop)
        offset = const Offset(0.0, 1.0);
      return SlideTransition(
        position: Tween<Offset>(
          begin: offset,
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    } else
      return theme.buildTransitions<T>(
          this, context, animation, secondaryAnimation, child);
  }

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';
}
