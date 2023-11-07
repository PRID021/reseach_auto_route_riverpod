import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TabControllerExt<T, R> useTabControllerExt<T, R>(
    {required int length,
    required ActionOnTabData<T, R> action,
    Duration? animationDuration,
    TickerProvider? vsync}) {
  late _TabControllerExt<T, R> tabController;

  useEffect(() {
    tabController = _TabControllerExt<T, R>(
        length: length,
        vsync: vsync ??= useSingleTickerProvider(),
        action: action,
        animationDuration: animationDuration);
  });

  return tabController;
}

typedef ActionOnTabData<T, R> = R Function(T data);

abstract class TabControllerExt<T, R> extends TabController {
  TabControllerExt({required super.length, required super.vsync});

  void setData(T data);

  T? get data;

  T? get nexDataAfterAnimated;

  R performActionOnTab();
}

class _TabControllerExt<T, R> extends TabController
    implements TabControllerExt<T, R> {
  _TabControllerExt({
    required super.length,
    required super.vsync,
    required this.action,
    super.animationDuration,
  }) {
    print("animation : ${animation != null}");
    animation?.addListener(() {
      print("animation value: ${animation!.value} && ${animation!.status}");
      if (animation!.status == AnimationStatus.forward) {
        notifyListeners();
      }
    });
  }

  final Map<int, T?> mapData = {};
  final ActionOnTabData<T, R> action;

  @override
  R performActionOnTab() {
    return action(mapData[index] as T);
  }

  @override
  void setData(covariant T data) {
    mapData[index] = data;
    notifyListeners();
  }

  @override
  get data => mapData[index];

  @override
// // TODO: implement nexData
  T? get nexDataAfterAnimated {
    if (animation!.value == null) return mapData[index];
    if (animation!.value - 0.3 > index) {
      return mapData[index + 1];
    }
    if (animation!.value + 0.3 < index) {
      return mapData[index - 1];
    }
    return mapData[index];
  }
}
