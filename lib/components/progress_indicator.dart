import 'package:assignment/theme/theme_config.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 45,
            width: 45,
            child: RefreshProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(ThemeConfiguration.themePrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}