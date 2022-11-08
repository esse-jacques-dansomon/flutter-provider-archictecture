import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/app_dimenssions.dart';

class AppHelper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String getAssetName(String fileName, String folderName) {
    return "assets/$folderName/$fileName";
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }


  static int getCrossAxisCount(BuildContext context, {double width = 0.0}) {
    final double large  = width==0 ? AppDimensions.MEDIA_SCREEN_LARGE : width*4;
    final double medium  = width==0 ? AppDimensions.MEDIA_SCREEN_MEDIUM : width*3;
    return MediaQuery.of(context).size.width > large ? 4 : (MediaQuery.of(context).size.width > medium? 3 : 2);
  }

  static void showInfoFlushBar(BuildContext context, String s, {Color color = AppColors.PRIMARY}) {
    AnimatedSnackBar.material(
      s,
      type: AnimatedSnackBarType.info,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      snackBarStrategy: StackSnackBarStrategy(),

    ).show(context);
    // Flushbar(
    //   message: s,
    //   duration: const Duration(seconds: 6),
    //   backgroundColor: color,
    //   flushbarPosition: FlushbarPosition.TOP,
    //   icon: const Icon(
    //     Icons.info,
    //     color: Colors.white,
    //   ),
    // ).show(context);


  }

  static showErrorFlushBar(BuildContext context, String string) {}
}