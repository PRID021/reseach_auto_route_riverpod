import 'package:flutter/material.dart';

class KeepAliveViewWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveViewWrapper({super.key, required this.child});

  @override
  _KeepAliveViewWrapperState createState() => _KeepAliveViewWrapperState();
}

class _KeepAliveViewWrapperState extends State<KeepAliveViewWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
