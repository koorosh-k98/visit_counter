import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/constants/values.dart';
import 'package:visit_counter/core/data/firestore_error_mapping_mixin.dart';
import 'package:visit_counter/core/data/firestore_error_response.dart';
import 'package:visit_counter/core/data/result.dart';
import 'package:visit_counter/features/create_url/data/models/visit_counter.dart';
import 'package:visit_counter/features/create_url/data/providers/firebase_db_provider.dart';

const String visitCounterCollection = 'VisitCounter';
const String usernameField = "Username";
const String count = "Count";

final createUrlDataSourceProvider = Provider<CreateUrlDataSource>((ref) {
  final db = ref.watch(firebaseDbProvider).db;
  return CreateUrlDataSource._(db: db, ref: ref);
});

class CreateUrlDataSource with FirestoreErrorMappingMixin {
  CreateUrlDataSource._({
    required FirebaseFirestore db,
    required this.ref,
  }) : _db = db;

  final FirebaseFirestore _db;
  final Ref ref;

  Future<Result<FirestoreErrorResponse, String>> generateUrl(
    String username,
    String label,
    int iconsIndex,
    int colorsIndex,
  ) async {
    try {
      VisitCounter visitCounter = VisitCounter(
        username: username,
        label: label,
        iconsIndex: iconsIndex,
        colorsIndex: colorsIndex,
        count: 0,
      );
      final snapshot = await _db
          .collection(visitCounterCollection)
          .where(usernameField, isEqualTo: username)
          .get();
      if (snapshot.docs.isEmpty) {
        await _db
            .collection(visitCounterCollection)
            .add(visitCounter.toFirestore())
            .timeout(const Duration(seconds: Values.connectionTimeout));
      } else {
        int previousCount = snapshot.docs.first.data()[count];
        VisitCounter newVisitCounter =
            visitCounter.copyWith(count: previousCount);
        await snapshot.docs.first.reference
            .set(newVisitCounter.toFirestore(), SetOptions(merge: true))
            .timeout(const Duration(seconds: Values.connectionTimeout));
      }
      return Success(Strings.counterUrl + username);
    } on FirebaseException catch (error, _) {
      return mapErrorResponse(error);
    }
  }
}
