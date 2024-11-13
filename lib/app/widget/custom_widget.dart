import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomWidget {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 15,
    );
  }
}