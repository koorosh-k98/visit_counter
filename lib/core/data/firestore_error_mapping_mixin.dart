import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visit_counter/core/core.dart';
import 'package:visit_counter/core/data/result.dart';

mixin class FirestoreErrorMappingMixin {
  Result<FirestoreErrorResponse, T> mapErrorResponse<T>(
      FirebaseException error) {
    final firestoreErrorResponse = FirestoreErrorResponse.fromException(error);
    return Failure(firestoreErrorResponse);
  }
}
