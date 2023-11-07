import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../route/config/router_config.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final tabs = const ['Users', 'Posts', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      // key: autoTabRoutesKey,
      routes: const [UsersRoute(), PostsRoute(), SettingsRoute()],
      homeIndex: 0,
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(tabsRouter.current.name),
            automaticallyImplyLeading: false,
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: tabs.indexed
                .map((e) => BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.abc,
                      size: 48,
                    ),
                    label: e.$2))
                .toList(),
          ),
        );
      },
    );
  }
}
