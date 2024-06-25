import 'package:fpdart/fpdart.dart';

abstract class Result<TFailure, TSuccess> {
  TSuccess? get success;

  TFailure? get failure;

  bool get isSuccess;

  bool get isFailure;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result &&
          runtimeType == other.runtimeType &&
          failure == other.failure &&
          success == other.success;

  @override
  int get hashCode => failure.hashCode ^ success.hashCode;
}

class Success<TFailure, TSuccess> extends Right<TFailure?, TSuccess?>
    implements Result<TFailure, TSuccess> {
  Success([super.value]);

  @override
  TSuccess? get success => value;

  @override
  TFailure? get failure => null;

  @override
  bool get isSuccess => isRight();

  @override
  bool get isFailure => isLeft();

  @override
  String toString() {
    return 'Success{success: $success}';
  }
}

class Failure<TFailure, TSuccess> extends Left<TFailure?, TSuccess>
    implements Result<TFailure, TSuccess> {
  Failure([super.failure]);

  @override
  TSuccess? get success => null;

  @override
  TFailure? get failure => value;

  @override
  bool get isSuccess => isRight();

  @override
  bool get isFailure => isLeft();

  @override
  String toString() {
    return 'Failure{failure: $failure}';
  }
}
