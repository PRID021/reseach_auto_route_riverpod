import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ValueNotifier<T?> useStateLog<T>([T? initialData]) {
  final result = useState<T?>(initialData);
  useValueChanged<T?, void>(result.value, (_, __) {
    if (kDebugMode) {
      print(result.value);
    }
  });
  return result;
}
