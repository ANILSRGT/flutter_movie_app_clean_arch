/// Base model class.
abstract class BaseModel<T extends Object> {
  /// json serialization.
  Map<String, dynamic> toJson();

  /// json deserialization.
  T fromJson(Map<String, dynamic> json);

  /// copyWith method.
  T copyWith();
}
