import 'package:nextdata/src/core/error/failures.dart';

/// A generic class to represent a result which can either be a success with a value
/// or a failure with an error.
class Result<T> {
  /// The value of the result if it is a success.
  final T? value;

  /// The failure of the result if it is a failure.
  final Failure? failure;

  /// Constructor to create a successful result with a value.
  Result.success(this.value) : failure = null;

  /// Constructor to create a failed result with a failure.
  Result.failure(this.failure) : value = null;

  /// Getter to check if the result is a success.
  bool get isSuccess => value != null;

  /// Getter to check if the result is a failure.
  bool get isFailure => failure != null;

  /// Method to handle both success and failure cases.
  ///
  /// Takes two required callback functions:
  /// - `success`: called when the result is a success.
  /// - `failure`: called when the result is a failure.
  void when({
    required void Function(T value) success,
    required void Function(Failure failure) failure,
  }) {
    // If the result is a success, call the success callback with the value.
    if (isSuccess) {
      success(value as T);
    }
    // If the result is a failure, call the failure callback with the failure.
    else if (isFailure) {
      failure(this.failure as Failure);
    }
  }
}
