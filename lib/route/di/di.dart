import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/router_config.dart';

part 'di.g.dart';

@riverpod
Raw<AppRouter> appRouter(AppRouterRef ref) {
  return AppRouter(ref: ref);
}

@riverpod
AppAutoRouteObserver routeObserver(RouteObserverRef ref, String locate) {
  return AppAutoRouteObserver();
}
