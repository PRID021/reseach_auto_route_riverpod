import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_route/hooks/use_tab_ext_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage<void>()
class BooksScreen extends HookWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("run build on line 17");

    final tab = useState(DateTime.now());
    final TabControllerExt<int, int?> tabExtController =
    useTabControllerExt<int, int?>(
      length: 3,
      action: (data) {
        if (kDebugMode) {
          print("perform with $data");
        }
      },
    );

    final focusNode = useFocusNode();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          // body: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Text("Books Screens"),
          //     HookBuilder(builder: (ctx) {
          //       final valueAsync = useMemoized(() async {
          //         final value = await Future.delayed(const Duration(seconds: 3))
          //             .then((value) => 1);
          //         return value;
          //       }, const []);
          //       return FutureBuilder(
          //           future: valueAsync,
          //           builder: (ctx, snapshot) {
          //             if (snapshot.hasData) {
          //               return Text("Complete with ${snapshot.data}");
          //             }
          //             if (snapshot.hasError) {
          //               return const Text("Unknown Error");
          //             }
          //             return const CircularProgressIndicator();
          //           });
          //     }),
          //     HookBuilder(
          //       builder: (BuildContext context) {
          //         final animationController = useAnimationController(
          //             duration: const Duration(seconds: 1));
          //         final animationValue = useAnimation(
          //             Tween<double>(begin: 0.0, end: 1.0)
          //                 .animate(animationController));
          //         return Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Text('Animated Value: $animationValue'),
          //             ElevatedButton(
          //               onPressed: () {
          //                 if (animationController.isCompleted) {
          //                   animationController.reverse();
          //                 } else {
          //                   animationController.forward();
          //                 }
          //               },
          //               child: const Text('Toggle Animation'),
          //             ),
          //           ],
          //         );
          //       },
          //     ),
          //     HookBuilder(builder: (context) {
          //       final useNotifier = useState(ValueNotifier<int>(0));
          //
          //       final useNotifierValue = useListenable(useNotifier.value);
          //       return Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text('Value: ${useNotifierValue.value}'),
          //           ElevatedButton(
          //             onPressed: () {
          //               // Update the ValueNotifier when the button is pressed.
          //               useNotifierValue.value += 1;
          //             },
          //             child: const Text('Increment Value'),
          //           ),
          //         ],
          //       );
          //     }),
          //     HookBuilder(builder: (ctx) {
          //       final textEditController = useTextEditingController();
          //       final buttonEnable =
          //           useTextEditControllerIsEmpty(textEditController);
          //
          //       return Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 16, vertical: 8),
          //             child: TextFormField(
          //               controller: textEditController,
          //               focusNode: focusNode,
          //             ),
          //           ),
          //           ElevatedButton(
          //             onPressed: buttonEnable ? () {} : null,
          //             child: const Text("Submit"),
          //           )
          //         ],
          //       );
          //     }),
          //     HookBuilder(builder: (context) {
          //       final useNotifier = useValueNotifier(0);
          //
          //       return Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text('Value: ${useNotifier.value}'),
          //           ElevatedButton(
          //             onPressed: () {
          //               // Update the ValueNotifier when the button is pressed.
          //               useNotifier.value += 1;
          //               // manually rebuild
          //               if (useNotifier.value % 2 == 0) {
          //                 (context as Element).markNeedsBuild();
          //               }
          //             },
          //             child: const Text('Increment[useValueNotifier] '),
          //           ),
          //         ],
          //       );
          //     }),
          //   ],
          // ),
          // for test custom tabExt
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              controller: tabExtController,
              tabs: [
                Tab(
                  text: "Tab1",
                  icon: Icon(Icons.code_sharp),
                ),
                Tab(text: "Tab2"),
                Tab(text: "Tab3"),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabExtController,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Text1"),
                    ElevatedButton(
                      onPressed: () {
                        tabExtController.setData(1);
                      },
                      child: const Text("Set value "),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Text2"),
                    ElevatedButton(
                      onPressed: () {
                        tabExtController.setData(2);
                      },
                      child: const Text("Set value "),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Text3"),
                    ElevatedButton(
                      onPressed: () {
                        tabExtController.setData(3);
                      },
                      child: const Text("Set value "),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.black12,
                ),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0)
                .copyWith(bottom: 8 + MediaQuery
                .of(context)
                .viewInsets
                .bottom),
            child: HookConsumer(
              builder: (context, ref, child) {
                final isEnable = useListenableSelector(tabExtController, () {
                  return tabExtController.nexDataAfterAnimated != null;
                });
                print("228");
                return ElevatedButton(
                  onPressed: !isEnable
                      ? null
                      : () {
                    // focusNode.requestFocus();
                    tabExtController.performActionOnTab();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("Focus TextFormField"),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
