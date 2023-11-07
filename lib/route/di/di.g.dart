// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appRouterHash() => r'd772916aef8db0ecd7297bd87188dce9ef482a59';

/// See also [appRouter].
@ProviderFor(appRouter)
final appRouterProvider = AutoDisposeProvider<Raw<AppRouter>>.internal(
  appRouter,
  name: r'appRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppRouterRef = AutoDisposeProviderRef<Raw<AppRouter>>;
String _$routeObserverHash() => r'eb46246a0068f15b7e5ac4996cf3f2d5c672b968';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [routeObserver].
@ProviderFor(routeObserver)
const routeObserverProvider = RouteObserverFamily();

/// See also [routeObserver].
class RouteObserverFamily extends Family<AppAutoRouteObserver> {
  /// See also [routeObserver].
  const RouteObserverFamily();

  /// See also [routeObserver].
  RouteObserverProvider call(
    String locate,
  ) {
    return RouteObserverProvider(
      locate,
    );
  }

  @override
  RouteObserverProvider getProviderOverride(
    covariant RouteObserverProvider provider,
  ) {
    return call(
      provider.locate,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'routeObserverProvider';
}

/// See also [routeObserver].
class RouteObserverProvider extends AutoDisposeProvider<AppAutoRouteObserver> {
  /// See also [routeObserver].
  RouteObserverProvider(
    String locate,
  ) : this._internal(
          (ref) => routeObserver(
            ref as RouteObserverRef,
            locate,
          ),
          from: routeObserverProvider,
          name: r'routeObserverProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$routeObserverHash,
          dependencies: RouteObserverFamily._dependencies,
          allTransitiveDependencies:
              RouteObserverFamily._allTransitiveDependencies,
          locate: locate,
        );

  RouteObserverProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.locate,
  }) : super.internal();

  final String locate;

  @override
  Override overrideWith(
    AppAutoRouteObserver Function(RouteObserverRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RouteObserverProvider._internal(
        (ref) => create(ref as RouteObserverRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        locate: locate,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AppAutoRouteObserver> createElement() {
    return _RouteObserverProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RouteObserverProvider && other.locate == locate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locate.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RouteObserverRef on AutoDisposeProviderRef<AppAutoRouteObserver> {
  /// The parameter `locate` of this provider.
  String get locate;
}

class _RouteObserverProviderElement
    extends AutoDisposeProviderElement<AppAutoRouteObserver>
    with RouteObserverRef {
  _RouteObserverProviderElement(super.provider);

  @override
  String get locate => (origin as RouteObserverProvider).locate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
