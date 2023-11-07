import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useTrackTime() {
  return use(const _TimeAlive());
}

class _TimeAlive extends Hook<void> {
  const _TimeAlive();

  @override
  _TimeAliveState createState() => _TimeAliveState();
}

class _TimeAliveState extends HookState<void, _TimeAlive> {
  late DateTime start;

  @override
  void build(BuildContext context) {}

  @override
  void initHook() {
    super.initHook();
    start = DateTime.now();
  }

  @override
  void dispose() {
    print(DateTime.now().difference(start));
    super.dispose();
  }
}
