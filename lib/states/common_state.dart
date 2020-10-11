import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CommonAppStates extends Equatable {
  // final List props;
  CommonAppStates([List props = const []]) : super(props);

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return super.toString();
  }
}

class Initial extends CommonAppStates {
  Initial();
  @override
  String toString() {
    return super.toString();
  }
}

class Loading extends CommonAppStates {
  Loading();
  @override
  String toString() {
    return super.toString();
  }
}

class Success extends CommonAppStates {
  Success();
  @override
  String toString() {
    return super.toString();
  }
}

class Failed extends CommonAppStates {
  String errorMsg;
  DioError dioError;
  dynamic statusCode;
  BuildContext context;
  Failed({this.errorMsg, this.dioError, this.statusCode, this.context});
  @override
  String toString() {
    return super.toString();
  }
}

class Timeout extends CommonAppStates {
  final String errorMsg;
  Timeout(this.errorMsg);
}

class SocketExcetionFailed extends CommonAppStates {}
// class Failed400 extends CommonAppStates {
//   String errorMsg;
//   DioError dioError;
//   List<GraphQLError> errors;
//   Failed400({this.errorMsg, this.errors});
//   @override
//   String toString() {
//     return super.toString();
//   }
// }

// class Failed401 extends CommonAppStates {
//   String errorMsg;
//   DioError dioError;
//   List<GraphQLError> errors;
//   Failed401({this.errorMsg, this.errors});
//   @override
//   String toString() {
//     return super.toString();
//   }
// }

// class Failed403 extends CommonAppStates {
//   String errorMsg;
//   DioError dioError;
//   List<GraphQLError> errors;
//   Failed403({this.errorMsg, this.errors});
//   @override
//   String toString() {
//     return super.toString();
//   }
// }

// class Failed500 extends CommonAppStates {
//   String errorMsg;
//   DioError dioError;
//   List<GraphQLError> errors;
//   Failed500({this.errorMsg, this.errors});
//   @override
//   String toString() {
//     return super.toString();
//   }
// }

// class Failed501 extends CommonAppStates {
//   String errorMsg;
//   DioError dioError;
//   List<GraphQLError> errors;
//   Failed501({this.errorMsg, this.errors});
//   @override
//   String toString() {
//     return super.toString();
//   }
// }

// class Failed502 extends CommonAppStates {
//   String errorMsg;
//   DioError dioError;
//   List<GraphQLError> errors;
//   Failed502({this.errorMsg, this.errors});
//   @override
//   String toString() {
//     return super.toString();
//   }
// }

// class Failed503 extends CommonAppStates {
//   String errorMsg;
//   DioError dioError;
//   List<GraphQLError> errors;
//   Failed503({this.errorMsg, this.errors});
//   @override
//   String toString() {
//     return super.toString();
//   }
// }

class NoDataFound extends CommonAppStates {
  final errorMsg;
  NoDataFound({this.errorMsg});
  @override
  String toString() {
    return super.toString();
  }
}
