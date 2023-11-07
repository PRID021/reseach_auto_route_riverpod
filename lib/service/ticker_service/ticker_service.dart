import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticker_service.g.dart';

typedef TickerServiceArg = ({Duration duration, VoidCallback onTimeout});

@Riverpod(keepAlive: true)
Raw<TickerService> tickerService(TickerServiceRef ref) {
  return TickerServiceImpl();
}

abstract class TickerService extends ChangeNotifier {
  Timer startTimer(TickerServiceArg arg);

  Timer resetTimer();

  bool get isActive;

  bool get isTimerExist;
}

class TickerServiceImpl extends TickerService {
  ({Timer timer, Duration duration})? _timerProps;

  @override
  Timer startTimer(TickerServiceArg arg) {
    if (isActive) {
      throw "Timer have been start!!";
    }
    addListener(arg.onTimeout);
    _timerProps ??=
        (timer: Timer(arg.duration, notifyListeners), duration: arg.duration);
    return _timerProps!.timer;
  }

  @override
  Timer resetTimer() {
    if (_timerProps == null) {
      throw "Timer have not been created!";
    }
    if (_timerProps!.timer.isActive) {
      _timerProps!.timer.cancel();
    }
    _timerProps = (
      timer: Timer(_timerProps!.duration, notifyListeners),
      duration: _timerProps!.duration
    );
    return _timerProps!.timer;
  }

  @override
  bool get isActive => isTimerExist && _timerProps!.timer.isActive;

  @override
  bool get isTimerExist => _timerProps != null;
}
