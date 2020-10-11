import 'package:connectivity/connectivity.dart';

/// Return true if device is connected with wifi or data network else return false.
Future<bool> hasConnectivity() async {
  var subscription = Connectivity();
  var check = await subscription.checkConnectivity();
  if (check == ConnectivityResult.mobile || check == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}
