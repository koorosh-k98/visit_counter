import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/core/data/repository_exception.dart';
import 'package:visit_counter/features/create_url/data/create_url_data_source.dart';

final createUrlRepositoryProvider = Provider<CreateUrlRepository>((ref) {
  return CreateUrlRepository(ref);
});

class CreateUrlRepository {
  CreateUrlRepository(this.ref);
  final Ref ref;

  Future<String> generateUrl({
    required String username,
    required String label,
    required int iconsIndex,
    required int colorsIndex,
  }) async {
    final response = await ref.read(createUrlDataSourceProvider).generateUrl(
      username,
      label,
      iconsIndex,
      colorsIndex,
    );
    if (response.isSuccess) {
      return response.success!;
    } else {
      throw RepositoryException(
        message: response.failure!.message,
        errorResponse: response.failure!,
      );
    }
  }
}