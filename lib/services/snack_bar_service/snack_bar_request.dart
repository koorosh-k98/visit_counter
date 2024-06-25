import 'package:equatable/equatable.dart';
import 'package:visit_counter/services/snack_bar_service/snack_bar_action_request.dart';

class SnackBarRequest extends Equatable {
  // Content to be shown in the snackBar
  final String content;

  // Duration the SnackBar appears for.
  // min: 4, max: 10
  final int duration;

  // Optional action to be shown on the SnackBar
  final SnackBarActionRequest? snackBarActionRequest;

  const SnackBarRequest(
      {required this.content,
      required this.duration,
      this.snackBarActionRequest});

  @override
  List<Object?> get props => [content, duration];
}
