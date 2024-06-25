import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/features/create_url/data/create_url_repository.dart';

final createUrlDataProvider = AsyncNotifierProvider<CreateUrlNotifier, String?>(
  () => CreateUrlNotifier(),
);

class CreateUrlNotifier extends AsyncNotifier<String?> {
  @override
  String? build() => null;

  void generateUrl(
    String username,
    String label,
    int iconsIndex,
    int colorsIndex,
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
  }
}
