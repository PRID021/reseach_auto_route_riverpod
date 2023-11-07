import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.error,
          size: 56,
        ),
      ),
    );
  }
}
