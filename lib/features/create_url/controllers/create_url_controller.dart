import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/features/create_url/data/providers/create_url_data_provider.dart';

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
  ) {
    ref.read(createUrlDataProvider.notifier).generateUrl(
          username,
          label,
          iconsIndex,
          colorsIndex,
        );
  }
}
