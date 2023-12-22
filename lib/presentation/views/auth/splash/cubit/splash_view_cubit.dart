import 'package:core/core.dart';

part 'splash_view_state.dart';

/// [SplashViewCubit] is a cubit that manages the state of the splash screen.
class SplashViewCubit extends BaseCubit<SplashViewState> {
  /// [SplashViewCubit] constructor.
  SplashViewCubit() : super(initialState: SplashViewState());

  /// [changeBusy] is a method to change the isBusy state.
  bool changeBusy(bool isBusy) {
    emit(state.copyWith(isBusy: isBusy));
    return isBusy;
  }
}
