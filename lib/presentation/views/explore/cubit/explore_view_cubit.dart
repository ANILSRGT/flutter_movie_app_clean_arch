import 'package:core/core.dart';

part 'explore_view_state.dart';

/// [ExploreViewCubit] is a cubit that manages the state of the explorer screen.
class ExploreViewCubit extends BaseCubit<ExploreViewState> {
  /// [ExploreViewCubit] constructor.
  ExploreViewCubit() : super(initialState: ExploreViewState());

  /// [changeBusy] is a method to change the isBusy state.
  bool changeBusy(bool isBusy) {
    emit(state.copyWith(isBusy: isBusy));
    return isBusy;
  }
}
