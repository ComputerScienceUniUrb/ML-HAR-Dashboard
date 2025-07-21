// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'players_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPlayersHash() => r'7128602005f9dd4e6acdb71fdba148c9fa1f97bb';

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

/// See also [getPlayers].
@ProviderFor(getPlayers)
const getPlayersProvider = GetPlayersFamily();

/// See also [getPlayers].
class GetPlayersFamily extends Family<AsyncValue<List<Player>>> {
  /// See also [getPlayers].
  const GetPlayersFamily();

  /// See also [getPlayers].
  GetPlayersProvider call(
    String sessionId,
  ) {
    return GetPlayersProvider(
      sessionId,
    );
  }

  @override
  GetPlayersProvider getProviderOverride(
    covariant GetPlayersProvider provider,
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
  String? get name => r'getPlayersProvider';
}

/// See also [getPlayers].
class GetPlayersProvider extends AutoDisposeStreamProvider<List<Player>> {
  /// See also [getPlayers].
  GetPlayersProvider(
    String sessionId,
  ) : this._internal(
          (ref) => getPlayers(
            ref as GetPlayersRef,
            sessionId,
          ),
          from: getPlayersProvider,
          name: r'getPlayersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPlayersHash,
          dependencies: GetPlayersFamily._dependencies,
          allTransitiveDependencies:
              GetPlayersFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  GetPlayersProvider._internal(
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
    Stream<List<Player>> Function(GetPlayersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPlayersProvider._internal(
        (ref) => create(ref as GetPlayersRef),
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
  AutoDisposeStreamProviderElement<List<Player>> createElement() {
    return _GetPlayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPlayersProvider && other.sessionId == sessionId;
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
mixin GetPlayersRef on AutoDisposeStreamProviderRef<List<Player>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GetPlayersProviderElement
    extends AutoDisposeStreamProviderElement<List<Player>> with GetPlayersRef {
  _GetPlayersProviderElement(super.provider);

  @override
  String get sessionId => (origin as GetPlayersProvider).sessionId;
}

String _$getPlayersCountHash() => r'cd031dd236d795a9104dfdd066640b155715b765';

/// See also [getPlayersCount].
@ProviderFor(getPlayersCount)
const getPlayersCountProvider = GetPlayersCountFamily();

/// See also [getPlayersCount].
class GetPlayersCountFamily extends Family<int> {
  /// See also [getPlayersCount].
  const GetPlayersCountFamily();

  /// See also [getPlayersCount].
  GetPlayersCountProvider call(
    String sessionId,
  ) {
    return GetPlayersCountProvider(
      sessionId,
    );
  }

  @override
  GetPlayersCountProvider getProviderOverride(
    covariant GetPlayersCountProvider provider,
  ) {
    return call(
      provider.sessionId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    getPlayersProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    getPlayersProvider,
    ...?getPlayersProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPlayersCountProvider';
}

/// See also [getPlayersCount].
class GetPlayersCountProvider extends AutoDisposeProvider<int> {
  /// See also [getPlayersCount].
  GetPlayersCountProvider(
    String sessionId,
  ) : this._internal(
          (ref) => getPlayersCount(
            ref as GetPlayersCountRef,
            sessionId,
          ),
          from: getPlayersCountProvider,
          name: r'getPlayersCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPlayersCountHash,
          dependencies: GetPlayersCountFamily._dependencies,
          allTransitiveDependencies:
              GetPlayersCountFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  GetPlayersCountProvider._internal(
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
    int Function(GetPlayersCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPlayersCountProvider._internal(
        (ref) => create(ref as GetPlayersCountRef),
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
  AutoDisposeProviderElement<int> createElement() {
    return _GetPlayersCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPlayersCountProvider && other.sessionId == sessionId;
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
mixin GetPlayersCountRef on AutoDisposeProviderRef<int> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GetPlayersCountProviderElement extends AutoDisposeProviderElement<int>
    with GetPlayersCountRef {
  _GetPlayersCountProviderElement(super.provider);

  @override
  String get sessionId => (origin as GetPlayersCountProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
