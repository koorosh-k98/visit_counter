import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/core/data/repository_exception.dart';
import 'package:visit_counter/features/create_url/data/create_url_data_source.dart';

final createUrlRepositoryProvider = Provider<CreateUrlRepository>(
  (ref) => CreateUrlRepository(
    createUrlDataSource: ref.watch(createUrlDataSourceProvider),
  ),
);

class CreateUrlRepository {
  final CreateUrlDataSource _createUrlDataSource;

  CreateUrlRepository({required CreateUrlDataSource createUrlDataSource})
      : _createUrlDataSource = createUrlDataSource;

  Future<String> generateUrl(
    String username,
    String label,
    int iconsIndex,
    int colorsIndex,
  ) async {
    final response = await _createUrlDataSource.generateUrl(
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
