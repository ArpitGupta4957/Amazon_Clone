import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class AppCommonWidgets {
  static void showSnackBar({
    required BuildContext context,
    required String titleText,
    required String message,
    required ContentType contentType,
  }) {
    final materialBanner = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: titleText,
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showSnackBar(materialBanner);
  }

  static ContentType successContentType=ContentType.success;
  static ContentType failureContentType=ContentType.failure;
  static ContentType helpContentType=ContentType.help;
  static ContentType warningContentType=ContentType.warning;
}
