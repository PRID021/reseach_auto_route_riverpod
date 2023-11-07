import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../pages/book_detail_screen.dart';
import '../../pages/books_screen.dart';
import '../../pages/dashboard/dashboard_screen.dart';
import '../../pages/dashboard/posts_screen.dart';
import '../../pages/dashboard/settings_screen.dart';
import '../../pages/dashboard/users_screen.dart';
import '../../pages/home_screen.dart';
import '../../pages/login_screen.dart';
import '../../pages/unknown_screen.dart';
import '../guard/auth_guard.dart';

part 'router_config.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final Ref ref;

  AppRouter({super.navigatorKey, required this.ref});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: LoginRoute.page, path: '/login'),
        CustomRoute(
          page: BooksRoute.page,
          path: '/books',
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
        ),
        AutoRoute(page: BookDetailRoute.page, path: '/detail/:id'),
        AutoRoute(
          path: '/dashboard',
          page: DashboardRoute.page,
          guards: [ref.watch(authGuardProvider)],
          children: [
            RedirectRoute(path: '', redirectTo: 'users'),
            AutoRoute(path: 'users', page: UsersRoute.page),
            AutoRoute(path: 'posts', page: PostsRoute.page),
            AutoRoute(path: 'settings', page: SettingsRoute.page),
          ],
        ),
        AutoRoute(page: UnknownRoute.page, path: '*'),
      ];
}

class AppAutoRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print('New route pushed: ${route.settings.name}');
    }
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    if (kDebugMode) {
      print('Tab route visited: ${route.name}');
    }
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    if (kDebugMode) {
      print('Tab route visited: ${route.name}');
    }
  }
}
