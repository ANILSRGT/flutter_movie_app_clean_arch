import 'package:flutter/material.dart';

/// [CachedTabBarItem] is used to cache the tab
/// so that the user does not lose the data when switching between tabs
class CachedTabBarItem extends StatefulWidget {
  /// [CachedTabBarItem] constructor
  const CachedTabBarItem({
    required this.tab,
    super.key,
  });

  /// [tab] is the tab that will be cached
  final Widget tab;

  @override
  State<CachedTabBarItem> createState() => _CachedTabState();
}

class _CachedTabState extends State<CachedTabBarItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.tab;
  }

  @override
  bool get wantKeepAlive => true;
}
