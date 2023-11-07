import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_route/service/auth_service/auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/use_state_log.dart.dart';
import '../route/config/router_config.dart';

@RoutePage<void>()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("build 20");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const Text(
            "Home Screen",
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              context.navigateTo(const DashboardRoute());
            },
            child: const Text("Go to Dashboard"),
          ),
          const IncreaseButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.navigate(const BooksRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class IncreaseButton extends HookConsumerWidget {
  const IncreaseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Activity> activity = ref.watch(activityProvider);
    final useCountLog = useStateLog(0);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.withAlpha(100)),
      onPressed: () {
        useCountLog.value = (useCountLog.value ?? 0) + 1;
        ref.invalidate(activityProvider);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: activity.when(
            skipLoadingOnRefresh: false,
            data: (activity) => FittedBox(
                  child: Text(
                    activity.activity,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            error: (e, __) {
              if (kDebugMode) {
                print(e);
              }
              return const Text("Error");
            },
            loading: () => const SizedBox(
                  height: 28,
                  width: 28,
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
