/// Base usecase class.
abstract class BaseUseCase<T, Params> {
  /// [BaseUseCase] constructor.
  const BaseUseCase();

  /// Calls the usecase.
  Future<T> call(Params params);
}

/// No params class.
class NoParams {}
