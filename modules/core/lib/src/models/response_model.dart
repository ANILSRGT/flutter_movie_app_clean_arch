import 'package:flutter/material.dart';

/// Response model
@immutable
sealed class ResponseModel<T> {
  /// Response model constructor
  const ResponseModel();

  /// Returns true if the response is success (positive)
  /// otherwise false
  bool get isSuccessPositive => this is ResponseModelSuccessPositive<T>;

  /// Returns true if the response is success (negative)
  /// otherwise false
  bool get isSuccessNegative => this is ResponseModelSuccessNegative<T>;

  /// Returns true if [isFail] or [isSuccessNegative]
  /// otherwise false
  bool get isNotSuccessPositive => isFail || isSuccessNegative;

  /// Returns true if the response is fail
  /// otherwise false
  bool get isFail => this is ResponseModelFail<T>;

  /// cast to [ResponseModelSuccessPositive]
  ResponseModelSuccessPositive<T> get asSuccessPositive =>
      this as ResponseModelSuccessPositive<T>;

  /// cast to [ResponseModelSuccessNegative]
  ResponseModelSuccessNegative<T> get asSuccessNegative =>
      this as ResponseModelSuccessNegative<T>;

  /// cast to [ResponseModelFail]
  ResponseModelFail<T> get asFail => this as ResponseModelFail<T>;
}

/// Response model success (positive)
class ResponseModelSuccessPositive<T> extends ResponseModel<T> {
  /// Response model success (positive) constructor
  const ResponseModelSuccessPositive({
    required this.data,
  });

  /// Data for success (positive) response
  final T data;
}

/// Response model success (negative)
class ResponseModelSuccessNegative<T> extends ResponseModel<T> {
  /// Response model success (negative) constructor
  const ResponseModelSuccessNegative({
    required this.message,
  });

  /// Data for success (negative) response
  final String message;
}

/// Response model fail
class ResponseModelFail<T> extends ResponseModel<T> {
  /// Response model fail constructor
  const ResponseModelFail({
    required this.message,
    this.code,
  });

  /// Error code
  final String? code;

  /// Message for fail response
  final String message;
}

/// Extension for [ResponseModelFail]
extension ResponseModelFailExtension<T> on ResponseModelFail<T> {
  /// cast to [ResponseModelFail]
  /// <br/>Example: `response.asFail.castTo<YourType>()`
  ResponseModelFail<R> convertTo<R>() => ResponseModelFail<R>(
        code: code,
        message: message,
      );
}

/// Extension for [ResponseModelSuccessNegative]
extension ResponseModelSuccessNegativeExtension<T>
    on ResponseModelSuccessNegative<T> {
  /// cast to [ResponseModelSuccessNegative]
  /// <br/>Example: `response.asSuccessNegative.castTo<YourType>()`
  ResponseModelSuccessNegative<R> convertTo<R>() =>
      ResponseModelSuccessNegative<R>(
        message: message,
      );
}

/// Extension for [ResponseModelSuccessPositive]
extension ResponseModelSuccessPositiveExtension<T>
    on ResponseModelSuccessPositive<T> {
  /// cast to [ResponseModelSuccessPositive]
  /// <br/>Example: `response.asSuccessPositive.castTo<YourType>()`
  ResponseModelSuccessPositive<R> convertTo<R>() =>
      ResponseModelSuccessPositive<R>(
        data: data as R,
      );
}
