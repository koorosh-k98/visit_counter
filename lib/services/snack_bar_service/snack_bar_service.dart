import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/constants/const_colors.dart';
import 'package:visit_counter/constants/spaces.dart';
import 'package:visit_counter/services/snack_bar_service/scaffold_messenger_key_provider.dart';
import 'package:visit_counter/services/snack_bar_service/snack_bar_request.dart';
import 'package:visit_counter/services/snack_bar_service/snack_bar_type.dart';
import 'package:visit_counter/widgets/body.dart';

final snackBarServiceProvider = Provider<SnackBarService>((ref) =>
    SnackBarService(
        scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider)));

class SnackBarService {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  SnackBarService(
      {required GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey})
      : _scaffoldMessengerKey = scaffoldMessengerKey;

  void showInformationSnackBar(SnackBarRequest request) {
    _showSnackBar(request, SnackBarType.information);
  }

  void showSuccessSnackBar(SnackBarRequest request) {
    _showSnackBar(request, SnackBarType.success);
  }

  void showWarningSnackBar(SnackBarRequest request) {
    _showSnackBar(request, SnackBarType.warning);
  }

  void showErrorSnackBar(SnackBarRequest request, {bool showIcon = false}) {
    _showSnackBar(request, SnackBarType.error, showIcon: showIcon);
  }

  void _showSnackBar(SnackBarRequest request, SnackBarType type,
      {bool showIcon = false}) {
    _scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: type.backgroundColor,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          if (showIcon)
            const Padding(
              padding: EdgeInsets.only(right: Spaces.large),
              child: Icon(
                Icons.error_outline,
                size: 16,
                color: ConstColors.snackBarIconColor,
              ),
            ),
          Expanded(
            child: Body(
              text: request.content,
            ),
          ),
        ],
      ),
      duration: Duration(seconds: request.duration),
      action: request.snackBarActionRequest != null
          ? SnackBarAction(
              label: request.snackBarActionRequest!.label,
              onPressed: request.snackBarActionRequest!.onPressed,
            )
          : null,
    ));
  }
}
