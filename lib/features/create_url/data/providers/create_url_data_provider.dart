import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/core/core.dart';
import 'package:visit_counter/features/create_url/data/create_url_repository.dart';

final createUrlDataProvider = AsyncNotifierProvider<CreateUrlData, String?>(
  () => CreateUrlData(),
);

class CreateUrlData extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    return null;
  }

  Future<void> generateUrl({
    required String username,
    required String label,
    required int iconsIndex,
    required int colorsIndex,
    required ScrollController scrollController,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final url = await ref.read(createUrlRepositoryProvider).generateUrl(
            username: username,
            label: label,
            iconsIndex: iconsIndex,
            colorsIndex: colorsIndex,
          );

      if (url.isNotEmpty) {
        ref.read(scrollProvider).scrollToBottom(scrollController);
      }

      return url;
    });
  }
}
