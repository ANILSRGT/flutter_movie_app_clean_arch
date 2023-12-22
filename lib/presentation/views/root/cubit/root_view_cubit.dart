import 'package:core/core.dart';

part 'root_view_state.dart';

/// [RootViewCubit] is a cubit that manages the state of the root screen.
class RootViewCubit extends BaseCubit<RootViewState> {
  /// [RootViewCubit] constructor.
  RootViewCubit() : super(initialState: RootViewState());

  /// [changeBusy] is a method to change the isBusy state.
  bool changeBusy(bool isBusy) {
    emit(state.copyWith(isBusy: isBusy));
    return isBusy;
  }
}
