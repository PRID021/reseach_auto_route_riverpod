// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      key: json['key'] as String,
      activity: json['activity'] as String,
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'activity': instance.activity,
      'type': instance.type,
      'participants': instance.participants,
      'price': instance.price,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityHash() => r'de5f44434989845acf52b0ff74a8806e101210cb';

/// See also [activity].
@ProviderFor(activity)
final activityProvider = FutureProvider<Activity>.internal(
  activity,
  name: r'activityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityRef = FutureProviderRef<Activity>;
String _$authServiceNotifierHash() =>
    r'72b40bf74297df6dad484c067c3b7836b0cbc700';

/// See also [AuthServiceNotifier].
@ProviderFor(AuthServiceNotifier)
final authServiceNotifierProvider =
    AutoDisposeNotifierProvider<AuthServiceNotifier, AuthState>.internal(
  AuthServiceNotifier.new,
  name: r'authServiceNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authServiceNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthServiceNotifier = AutoDisposeNotifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
