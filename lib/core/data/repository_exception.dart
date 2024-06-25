import 'package:visit_counter/core/core.dart';

import 'firestore_error_response.dart';

class RepositoryException implements Exception {
  final String? message;
  final FirestoreErrorResponse errorResponse;

  RepositoryException({
    this.message,
    required this.errorResponse,
  });

  FirestoreErrorResponseType get firestoreErrorResponseType =>
      errorResponse.type;

  String? get apiErrorCode => errorResponse.errorCode;

  @override
  String toString() => 'Repository Exception: $message';
}

extension RepositoryExceptionExtensions on RepositoryException {
  Map<String, String> get context => {
        'ResponseType': firestoreErrorResponseType.toString(),
      };
}
