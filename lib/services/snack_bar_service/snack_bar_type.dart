import 'package:flutter/material.dart';
import 'package:visit_counter/constants/const_colors.dart';

enum SnackBarType { information, success, warning, error }

extension SnackBarTypeExtension on SnackBarType {
  Color get backgroundColor {
    switch (this) {
      case SnackBarType.information:
        return ConstColors.snackBarInformationBackgroundColor;
      case SnackBarType.success:
        return ConstColors.snackBarSuccessBackgroundColor;
      case SnackBarType.warning:
        return ConstColors.snackBarWarningBackgroundColor;
      case SnackBarType.error:
        return ConstColors.snackBarErrorBackgroundColor;
    }
  }

  Color get foregroundColor {
    switch (this) {
      case SnackBarType.information:
        return ConstColors.snackBarInformationForegroundColor;
      case SnackBarType.success:
        return ConstColors.snackBarSuccessForegroundColor;
      case SnackBarType.warning:
        return ConstColors.snackBarWarningForegroundColor;
      case SnackBarType.error:
        return ConstColors.snackBarErrorForegroundColor;
    }
  }
}
