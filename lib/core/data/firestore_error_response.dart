import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_counter/core/core.dart';

enum FirestoreErrorResponseType {
  unknown,
  objectNotFound,
  bucketNotFound,
  projectNotFound,
  quotaExceeded,
  unauthenticated,
  unauthorized,
  retryLimitExceeded,
  inValidChecksum,
  cancelled,
  invalidEventName,
  invalidUrl,
  invalidArgument,
  noDefaultBucket,
  cannotSliceBlob,
  serverFileWrongSize,
}

class FirestoreErrorResponse extends Equatable {
  final FirestoreErrorResponseType type;
  final String? message;
  final StackTrace? stackTrace;
  final String? errorCode;

  const FirestoreErrorResponse({
    required this.type,
    this.message,
    this.stackTrace,
    this.errorCode,
  });

  factory FirestoreErrorResponse.fromException(FirebaseException exception) =>
      FirestoreErrorResponse(
        type: switch (exception.code) {
          FirestoreResponseCodes.bucketNotFound =>
            FirestoreErrorResponseType.bucketNotFound,
          FirestoreResponseCodes.cancelled =>
            FirestoreErrorResponseType.cancelled,
          FirestoreResponseCodes.cannotSliceBlob =>
            FirestoreErrorResponseType.cannotSliceBlob,
          FirestoreResponseCodes.invalidArgument =>
            FirestoreErrorResponseType.invalidArgument,
          FirestoreResponseCodes.invalidEventName =>
            FirestoreErrorResponseType.invalidEventName,
          FirestoreResponseCodes.invalidUrl =>
            FirestoreErrorResponseType.invalidUrl,
          FirestoreResponseCodes.inValidChecksum =>
            FirestoreErrorResponseType.inValidChecksum,
          FirestoreResponseCodes.noDefaultBucket =>
            FirestoreErrorResponseType.noDefaultBucket,
          FirestoreResponseCodes.objectNotFound =>
            FirestoreErrorResponseType.objectNotFound,
          FirestoreResponseCodes.projectNotFound =>
            FirestoreErrorResponseType.projectNotFound,
          FirestoreResponseCodes.quotaExceeded =>
            FirestoreErrorResponseType.quotaExceeded,
          FirestoreResponseCodes.retryLimitExceeded =>
            FirestoreErrorResponseType.retryLimitExceeded,
          FirestoreResponseCodes.serverFileWrongSize =>
            FirestoreErrorResponseType.serverFileWrongSize,
          FirestoreResponseCodes.unauthenticated =>
            FirestoreErrorResponseType.unauthenticated,
          FirestoreResponseCodes.unauthorized =>
            FirestoreErrorResponseType.unauthorized,
          _ => FirestoreErrorResponseType.unknown,
        },
        message: exception.message,
        stackTrace: exception.stackTrace,
        errorCode: exception.code,
      );

  @override
  List<Object?> get props => [
        type,
        message,
        stackTrace,
      ];
}
