import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/core/core.dart';
import 'package:visit_counter/features/create_url/data/create_url_repository.dart';

final createUrlDataProvider =
    AutoDisposeAsyncNotifierProvider<CreateUrlNotifier, String?>(
  () => CreateUrlNotifier(),
);

class CreateUrlNotifier extends AutoDisposeAsyncNotifier<String?> {
  @override
  String? build() => null;

  void generateUrl(
    String username,
    String label,
    int iconsIndex,
    int colorsIndex,
    ScrollController scrollController,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref.read(createUrlRepositoryProvider).generateUrl(
            username,
            label,
            iconsIndex,
            colorsIndex,
          );
    });
    ref.read(scrollProvider).scrollToBottom(scrollController);
  }
}
