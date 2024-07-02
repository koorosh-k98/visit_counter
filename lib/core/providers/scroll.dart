import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/constants/values.dart';

final scrollProvider = Provider((ref) => Scroll());

class Scroll {
  void scrollToTop(ScrollController scrollController) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: Values.scrollAnimationDelay),
          () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.minScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(
              milliseconds: Values.scrollAnimationDuration,
            ),
          );
        }
      });
    });
  }

  void scrollToBottom(ScrollController scrollController) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: Values.scrollAnimationDelay),
          () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(
              milliseconds: Values.scrollAnimationDuration,
            ),
          );
        }
      });
    });
  }
}
