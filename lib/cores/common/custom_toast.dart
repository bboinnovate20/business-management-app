import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nex_spot_app/cores/common/widget/toast_view.dart';

class CustomToast {
  
  CustomToast(this.key){
    fToast.init(key.context);
  }

  final NavigatorState key;
  final fToast = FToast();
  

  showErrorMessage(String message) {
    fToast.showToast(child: CustomErrorToastView(toastMessage: message),
     toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 40.0,
            left: 5,
            right: 5,
            child: child,
          );
        });
  }

  showSuccessMessage(String message) {
    fToast.showToast(child: CustomSuccessToastView(toastMessage: message),
     toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 40.0,
            left: 5.0,
            child: child,
          );
        });
  }
}