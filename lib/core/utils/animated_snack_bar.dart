import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

ShowAnimatedSnackDiolog(
  BuildContext context, {
   AnimatedSnackBarType? type,
   String? message,
}) {
  AnimatedSnackBar.material(
    message ?? "",
    type: type ?? AnimatedSnackBarType.success,
    mobileSnackBarPosition:
        MobileSnackBarPosition.bottom, // Position of snackbar on mobile devices
    desktopSnackBarPosition: DesktopSnackBarPosition
        .topRight, // Position of snackbar on desktop devices
  ).show(context);
}
