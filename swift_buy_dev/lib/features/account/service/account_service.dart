import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/common_widgets.dart';
import '../../authentication/screens/auth_screen.dart';

class AccountService{
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
            (route) => false,
      );
      AppCommonWidgets.showSnackBar(
          context: context,
          titleText: "Great!",
          message: "You have successfully Logged Out",
          contentType: AppCommonWidgets.successContentType);
    } catch (e) {
      AppCommonWidgets.showSnackBar(
          context: context,
          titleText: "Oh Snap!",
          message: e.toString(),
          contentType: AppCommonWidgets.failureContentType);
    }
  }
}