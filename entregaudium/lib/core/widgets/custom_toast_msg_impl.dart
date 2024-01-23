import 'package:entregaudium/core/models/Failure.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'custom_toast.dart';

class CustomToastMessageImpl implements CustomToastMessage{

  @override
  showCustomFailureToast(Failure failure) {
    Fluttertoast.showToast(
        msg: failure.message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}