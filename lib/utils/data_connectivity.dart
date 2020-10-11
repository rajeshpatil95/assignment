// import 'package:connectivity/connectivity.dart';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

enum InternetConnectionStatus { Error, Connected, NoConnection }

abstract class DataConnectivity {
  /// Called when data connection found.
  @protected
  connected();

  /// Called when data connection lost.
  @protected
  disConnected();
  // onError(e);

  //  @override
  //  onError(s);
}

/// listen internet availability.
class InternetConnection {
  var subscription = Connectivity();
  DataConnectivity connect;
  InternetConnectionStatus internetConnectionStatus;
  InternetConnection({this.connect}) {
    internetConnectionStatus = connectivity();
  }
  InternetConnectionStatus connectivity() {
    var internetConnectionStatus;
    subscription.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        connect.connected();
        internetConnectionStatus = InternetConnectionStatus.Connected;
      } else {
        connect.disConnected();
        internetConnectionStatus = InternetConnectionStatus.NoConnection;
      }
    }).onError((s) {
      // connect.onError(s);
    });
    return internetConnectionStatus;
  }
}
