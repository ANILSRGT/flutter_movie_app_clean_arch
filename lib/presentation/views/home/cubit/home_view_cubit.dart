import 'package:core/core.dart';

part 'home_view_state.dart';

/// [HomeViewCubit] is a cubit that manages the state of the home screen.
class HomeViewCubit extends BaseCubit<HomeViewState> {
  /// [HomeViewCubit] constructor.
  HomeViewCubit() : super(initialState: HomeViewState());

  /// [changeBusy] is a method to change the isBusy state.
  bool changeBusy(bool isBusy) {
    emit(state.copyWith(isBusy: isBusy));
    return isBusy;
  }
}
