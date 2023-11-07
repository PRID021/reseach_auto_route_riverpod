import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../ticker_service/ticker_service.dart';

part 'auth_service.freezed.dart';
part 'auth_service.g.dart';

@freezed
class Activity with _$Activity {
  factory Activity({
    required String key,
    required String activity,
    required String type,
    required int participants,
    required double price,
  }) = _Activity;

  /// Convert a JSON object into an [Activity] instance.
  /// This enables type-safe reading of the API response.
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}

@Riverpod(keepAlive: true)
Future<Activity> activity(ActivityRef ref) async {
  final options = BaseOptions(
    baseUrl: 'https://boredapi.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final dio = Dio(options)
    ..interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Do something before request is sent.
          // If you want to resolve the request with custom data,
          // you can resolve a `Response` using `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject with a `DioException` using `handler.reject(dioError)`.
          print("Request: ${options.uri}");
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioException` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(e);
        },
      ),
    ]);

  final response = await dio.get('/api/activity', cancelToken: cancelToken);
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  // final json = jsonDecode(response.data);
  // Finally, we convert the Map into an Activity instance.
  return Activity.fromJson(response.data);
}

@Riverpod(keepAlive: false)
class AuthServiceNotifier extends _$AuthServiceNotifier with ChangeNotifier {
  @override
  AuthState build() {
    return AuthState(isValidated: false);
  }

  void setResult(bool success) {
    if (success == state.isValidated) {
      return;
    }
    state = state.copyWith(isValidated: success);
    notifyListeners();
    final tickerService = ref.read(tickerServiceProvider);
    if (!tickerService.isTimerExist && !tickerService.isActive) {
      tickerService.startTimer(
          (duration: const Duration(seconds: 5), onTimeout: setTimer));
    }
  }

  void setTimer() {
    setResult(false);
  }

  @override
  void dispose() {
    ref.watch(tickerServiceProvider).removeListener(setTimer);
    super.dispose();
  }
}

@freezed
class AuthState with _$AuthState {
  factory AuthState({required bool isValidated}) = _AuthState;
}
