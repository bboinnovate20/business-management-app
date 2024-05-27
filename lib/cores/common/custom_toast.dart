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
    fToast.showToast(child: CustomToastView(toastMessage: message, isError: true),
    fadeDuration:const Duration(milliseconds: 100),
     toastDuration: const Duration(seconds: 4),
        positionedToastBuilder: (context, child) {
          return _ToastWidget(child: child);
        });
  }

  showSuccessMessage(String message) {
    fToast.showToast(child: CustomToastView(toastMessage: message),
      fadeDuration:const Duration(milliseconds: 100),
     toastDuration: const Duration(seconds: 4),
        positionedToastBuilder: (context, child) {
          return _ToastWidget(child: child);
        });
  }
}


class _ToastWidget extends StatefulWidget {
  const _ToastWidget({super.key, required this.child});

  final Widget child;
  @override
  State<_ToastWidget> createState() => __ToastWidgetState();
}

class __ToastWidgetState extends State<_ToastWidget> {

  double top = -20;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () => setState(() => top = 40));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            top: top,
            left: 5.0,
            child: widget.child,
          );
  }
}