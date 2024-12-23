import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility/shared_pref_service/SharedService.dart';

class CustomTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> tabViews;
  final double indicatorWeight;
  final void Function(int index)? onTabSwapped;

  const CustomTabBar({
    Key? key,
    required this.tabs,
    required this.tabViews,
    this.indicatorWeight = 4.0,
    this.onTabSwapped,
  }) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final sp = SharedService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    _tabController.addListener(_handleTabSwapped);
  }

  void _handleTabSwapped() {
    if (!_tabController.indexIsChanging) {
      widget.onTabSwapped?.call(_tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSwapped);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch current theme data
    final ThemeData theme = Theme.of(context);
    final Color indicatorColor = theme.indicatorColor;
    final Color labelColor = theme.textTheme.titleLarge?.color ?? Colors.black;
    final Color unselectedLabelColor = theme.unselectedWidgetColor;
    return Scaffold(
      backgroundColor: sp.getString("currentColor") == "dr" ||
              sp.getString("currentColor") == null
          ? Colors.black87
          : Get.theme.primaryColor,
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: widget.tabs,
            indicatorColor: indicatorColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: labelColor,
            unselectedLabelColor: unselectedLabelColor,
            automaticIndicatorColorAdjustment: true,
            labelStyle: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
            indicatorWeight: widget.indicatorWeight,
            padding: EdgeInsets.all(0),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
