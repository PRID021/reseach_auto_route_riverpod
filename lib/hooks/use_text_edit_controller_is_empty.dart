import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

bool useTextEditControllerIsEmpty(TextEditingController textEditingController) {
  return useListenableSelector(
      textEditingController, () => textEditingController.text.isNotEmpty);
}
