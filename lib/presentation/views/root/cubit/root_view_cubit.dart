import 'package:core/core.dart';
import 'package:flutter_movie_app/presentation/views/root/widgets/root_tab_widget.dart';

part 'root_view_state.dart';

/// [RootViewCubit] is a cubit that manages the state of the root screen.
class RootViewCubit extends BaseCubit<RootViewState> {
  /// [RootViewCubit] constructor.
  RootViewCubit() : super(initialState: RootViewState());

  /// [changeBusy] is a method to change the isBusy state.
  void changeBusy(bool isBusy) {
    emit(state.copyWith(isBusy: isBusy));
  }

  /// [changeTab] is a method to change the current tab.
  /// It returns the current tab.
  void changeTab(RootTabs currentTab) {
    emit(state.copyWith(currentTab: currentTab));
  }
}
