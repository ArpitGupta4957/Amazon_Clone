import 'package:flutter/material.dart';

Future<Widget?> loadingWidget(BuildContext context) {
  return showDialog(
      barrierColor: Colors.black26,
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0.0,
          backgroundColor: Colors.white.withOpacity(0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
}
