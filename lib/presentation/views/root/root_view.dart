import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/base/base_view_state.dart';
import 'package:flutter_movie_app/presentation/views/explore/explore_view.dart';
import 'package:flutter_movie_app/presentation/views/home/home_view.dart';
import 'package:flutter_movie_app/presentation/views/root/cubit/root_view_cubit.dart';
import 'package:flutter_movie_app/presentation/views/root/widgets/root_tab_widget.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

part 'root_view_mixin.dart';

/// [RootView] is shown to the user after the user has logged in
@RoutePage()
class RootView extends StatefulWidget {
  /// [RootView] constructor
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends BaseViewState<RootView>
    with
        RootViewMixin,
        FunctionDurationMixin,
        SingleTickerProviderStateMixin<RootView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootViewCubit>(
      create: (context) => rootViewCubit,
      child: Scaffold(
        bottomNavigationBar: _buildBottomBar(),
        body: _buildBody(),
      ),
    );
  }

  Container _buildBottomBar() {
    return Container(
      decoration: BoxDecoration(
        color: context.general.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: currentTheme.staticColors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: context.border.lowBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTab(RootTabs.home),
          _buildTab(RootTabs.explore),
        ],
      ),
    );
  }

  Widget _buildTab(RootTabs tab) {
    return BlocBuilder<RootViewCubit, RootViewState>(
      bloc: rootViewCubit,
      buildWhen: (previous, current) =>
          previous.currentTab != current.currentTab,
      builder: (_, state) {
        return RootTabWidget(
          onSelectedTab: onSelectedTab,
          tab: tab,
          isSelected: state.currentTab == tab,
          selectedColor: context.general.colorScheme.onBackground,
          unselectedColor:
              context.general.colorScheme.onBackground.withOpacity(0.5),
        );
      },
    );
  }

  Widget _buildBody() {
    return PageView(
      controller: rootPageController,
      onPageChanged: onChangedTab,
      children: const [
        CachedTabBarItem(
          tab: HomeView(),
        ),
        CachedTabBarItem(
          tab: ExploreView(),
        ),
      ],
    );
  }
}
