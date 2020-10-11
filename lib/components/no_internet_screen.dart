import 'package:assignment/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'common_button.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  final VoidCallback onPress;
  NoInternetConnectionScreen({this.onPress});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.signal_cellular_off,
            size: 30,
          ),
          sizeBoxH10,
          Text(
            "No Connection",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          sizeBoxH10,
          Container(
            width: 250,
            child: Text(
              "Please Check your internet connectivity and try again",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ),
          sizeBoxH10,
          CommonButton(
            width: 120,
            height: 33,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            textStyle: TextStyle(fontSize: 14, color: Colors.white),
            color: Colors.blue,
            onPressed: () {
              onPress();
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            text: "TRY AGAIN",
          )
        ],
      ),
    ));
  }
}
