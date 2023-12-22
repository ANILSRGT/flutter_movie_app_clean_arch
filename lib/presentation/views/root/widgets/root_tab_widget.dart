import 'package:flutter/material.dart';

/// [RootTabs] is the enum for tabs.
enum RootTabs {
  /// [home] is the home tab.
  home(
    title: 'Home',
    icon: Icon(Icons.home_rounded),
  ),

  /// [explore] is the explore tab.
  explore(
    title: 'Explore',
    icon: Icon(Icons.search_rounded),
  );

  const RootTabs({
    required this.title,
    required this.icon,
  });

  /// [title] is the title of the tab.
  final String title;

  /// [icon] is the icon of the tab.
  final Widget icon;
}

/// [RootTabWidget] is the widget for tabs for root screen.
class RootTabWidget extends StatelessWidget {
  /// [RootTabWidget] constructor
  const RootTabWidget({
    required this.tab,
    required this.onSelectedTab,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    super.key,
  });

  /// [tab] is the tab.
  final RootTabs tab;

  /// [onSelectedTab] is called when a tab is selected.
  final void Function(RootTabs currentTab) onSelectedTab;

  /// [isSelected] is the boolean value for if the tab is selected.
  final bool isSelected;

  /// [selectedColor] is the color of the selected tab.
  final Color selectedColor;

  /// [unselectedColor] is the color of the unselected tab.
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onSelectedTab(tab),
      icon: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: List.generate(
              2,
              (index) => isSelected ? selectedColor : unselectedColor,
            ),
          ).createShader(bounds);
        },
        child: tab.icon,
      ),
    );
  }
}
