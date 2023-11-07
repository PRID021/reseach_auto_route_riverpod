import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/auth_service/auth_service.dart';
import '../config/router_config.dart';

part 'auth_guard.g.dart';

@Riverpod(keepAlive: true)
AuthGuard authGuard(AuthGuardRef ref) {
  return AuthGuard(ref: ref);
}

class AuthGuard extends AutoRouteGuard {
  final AuthGuardRef ref;

  AuthGuard({required this.ref});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authStateNotifier = ref.read(authServiceNotifierProvider.notifier);
    if (!authStateNotifier.state.isValidated) {
      try {
        resolver.redirect(LoginRoute(onResult: (success) {
          if (success) {
            authStateNotifier.setResult(success);
            resolver.next(success);
          }
        }));
      } catch (e) {
        print(e);
      }
    } else {
      resolver.next(true);
    }
  }
}
