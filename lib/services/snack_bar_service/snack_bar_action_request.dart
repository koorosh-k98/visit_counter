class SnackBarActionRequest {
  final String label;
  final void Function() onPressed;

  SnackBarActionRequest({
    required this.label,
    required this.onPressed,
  });
}
