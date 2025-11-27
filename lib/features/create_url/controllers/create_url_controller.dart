import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/core/providers/scroll.dart';
import 'package:visit_counter/features/create_url/data/providers/create_url_data_provider.dart';
import 'package:visit_counter/features/create_url/data/providers/form_key_provider.dart';
import 'package:visit_counter/services/snack_bar_service/snack_bar_request.dart';
import 'package:visit_counter/services/snack_bar_service/snack_bar_service.dart';

final createUrlControllerProvider = Provider<CreateUrlController>(
  (ref) => CreateUrlController(ref: ref),
);

class CreateUrlController {
  Ref ref;

  CreateUrlController({required this.ref});

  void generateUrl(
    String username,
    String label,
    int iconsIndex,
    int colorsIndex,
    ScrollController scrollController,
  ) {
    ref.read(createUrlDataProvider.notifier).generateUrl(
          username: username,
          label: label,
          iconsIndex: iconsIndex,
          colorsIndex: colorsIndex,
          scrollController: scrollController,
        );
  }

  void generate(
    String username,
    String label,
    int iconsIndex,
    int colorsIndex,
    ScrollController scrollController,
  ) {
    final formKey = ref.watch(formKeyProvider);
    bool? result = formKey.currentState?.validate();
    if (result ?? false) {
      generateUrl(username, label, iconsIndex, colorsIndex, scrollController);
    } else {
      ref.read(scrollProvider).scrollToTop(scrollController);
    }
  }

  void onCopyButtonPressed(String url) {
    Clipboard.setData(ClipboardData(text: url));
    ref.read(snackBarServiceProvider).showSuccessSnackBar(
          const SnackBarRequest(
            content: Strings.copied,
            duration: Values.copiedSnackBarDuration,
          ),
        );
  }
}
