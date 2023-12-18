import 'package:core/src/base/base_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Base class for all cubits
abstract class BaseCubit<T extends BaseBlocState> extends Cubit<T> {
  /// [BaseCubit] constructor
  BaseCubit({required this.initialState}) : super(initialState);

  /// The initial state of the cubit
  final T initialState;
}
