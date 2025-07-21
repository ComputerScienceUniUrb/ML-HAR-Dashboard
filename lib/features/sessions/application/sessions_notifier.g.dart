// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSessionsHash() => r'a9c65f6a79245487d2201f8c3db2543915c2b21a';

/// See also [getSessions].
@ProviderFor(getSessions)
final getSessionsProvider = AutoDisposeStreamProvider<List<Session>>.internal(
  getSessions,
  name: r'getSessionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getSessionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetSessionsRef = AutoDisposeStreamProviderRef<List<Session>>;
String _$getSessionsByIdHash() => r'b82ee56372709a9a791c8499efd0a1d6228caac7';

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

/// See also [getSessionsById].
@ProviderFor(getSessionsById)
const getSessionsByIdProvider = GetSessionsByIdFamily();

/// See also [getSessionsById].
class GetSessionsByIdFamily extends Family<AsyncValue<Session>> {
  /// See also [getSessionsById].
  const GetSessionsByIdFamily();

  /// See also [getSessionsById].
  GetSessionsByIdProvider call(
    String sessionId,
  ) {
    return GetSessionsByIdProvider(
      sessionId,
    );
  }

  @override
  GetSessionsByIdProvider getProviderOverride(
    covariant GetSessionsByIdProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'getSessionsByIdProvider';
}

/// See also [getSessionsById].
class GetSessionsByIdProvider extends AutoDisposeStreamProvider<Session> {
  /// See also [getSessionsById].
  GetSessionsByIdProvider(
    String sessionId,
  ) : this._internal(
          (ref) => getSessionsById(
            ref as GetSessionsByIdRef,
            sessionId,
          ),
          from: getSessionsByIdProvider,
          name: r'getSessionsByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSessionsByIdHash,
          dependencies: GetSessionsByIdFamily._dependencies,
          allTransitiveDependencies:
              GetSessionsByIdFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  GetSessionsByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Override overrideWith(
    Stream<Session> Function(GetSessionsByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSessionsByIdProvider._internal(
        (ref) => create(ref as GetSessionsByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Session> createElement() {
    return _GetSessionsByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSessionsByIdProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetSessionsByIdRef on AutoDisposeStreamProviderRef<Session> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GetSessionsByIdProviderElement
    extends AutoDisposeStreamProviderElement<Session> with GetSessionsByIdRef {
  _GetSessionsByIdProviderElement(super.provider);

  @override
  String get sessionId => (origin as GetSessionsByIdProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
