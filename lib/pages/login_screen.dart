import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  final Function(bool) onResult;

  const LoginScreen({super.key, required this.onResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          ElevatedButton(
            onPressed: () {
              context.popRoute();
              onResult(true);
            },
            child: const Text("Authenticated Successes"),
          ),
          ElevatedButton(
            onPressed: () {
              context.popRoute();
              onResult(false);
            },
            child: const Text("Authenticated Fail"),
          ),
        ],
      ),
    );
  }
}
