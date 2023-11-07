import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auto_route/route/di/di.dart';
import 'package:flutter_auto_route/service/auth_service/auth_service.dart';
import 'package:flutter_auto_route/service/ticker_service/ticker_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(appRouterProvider).config(
            deepLinkBuilder: (deepLink) {
              if (kDebugMode) {
                print(deepLink.path);
              }
              return deepLink;
            },
            reevaluateListenable:
                ref.watch(authServiceNotifierProvider.notifier),
            navigatorObservers: () => [ref.read(routeObserverProvider("root"))],
          ),
      builder: (ctx, child) => Listener(
        behavior: HitTestBehavior.translucent,
        onPointerUp: (_) {
          final tickerService = ref.read(tickerServiceProvider);
          if (tickerService.isTimerExist) {
            print("reset timmer");
            tickerService.resetTimer();
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: mySystemTheme,
          child: child!,
        ),
      ),
    );
  }
}
