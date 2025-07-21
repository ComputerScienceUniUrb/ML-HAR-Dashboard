// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTracksHash() => r'71d5e6d57878dee90215738191eec8a148c1b7f7';

/// See also [getTracks].
@ProviderFor(getTracks)
final getTracksProvider = AutoDisposeStreamProvider<List<Track>>.internal(
  getTracks,
  name: r'getTracksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTracksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetTracksRef = AutoDisposeStreamProviderRef<List<Track>>;
String _$getTracksByExperimentIdHash() =>
    r'2561a59a126528a829aa0c592752f872fd5a6824';

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

/// See also [getTracksByExperimentId].
@ProviderFor(getTracksByExperimentId)
const getTracksByExperimentIdProvider = GetTracksByExperimentIdFamily();

/// See also [getTracksByExperimentId].
class GetTracksByExperimentIdFamily extends Family<AsyncValue<List<Track>>> {
  /// See also [getTracksByExperimentId].
  const GetTracksByExperimentIdFamily();

  /// See also [getTracksByExperimentId].
  GetTracksByExperimentIdProvider call(
    String experimentId,
  ) {
    return GetTracksByExperimentIdProvider(
      experimentId,
    );
  }

  @override
  GetTracksByExperimentIdProvider getProviderOverride(
    covariant GetTracksByExperimentIdProvider provider,
  ) {
    return call(
      provider.experimentId,
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
  String? get name => r'getTracksByExperimentIdProvider';
}

/// See also [getTracksByExperimentId].
class GetTracksByExperimentIdProvider
    extends AutoDisposeStreamProvider<List<Track>> {
  /// See also [getTracksByExperimentId].
  GetTracksByExperimentIdProvider(
    String experimentId,
  ) : this._internal(
          (ref) => getTracksByExperimentId(
            ref as GetTracksByExperimentIdRef,
            experimentId,
          ),
          from: getTracksByExperimentIdProvider,
          name: r'getTracksByExperimentIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTracksByExperimentIdHash,
          dependencies: GetTracksByExperimentIdFamily._dependencies,
          allTransitiveDependencies:
              GetTracksByExperimentIdFamily._allTransitiveDependencies,
          experimentId: experimentId,
        );

  GetTracksByExperimentIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.experimentId,
  }) : super.internal();

  final String experimentId;

  @override
  Override overrideWith(
    Stream<List<Track>> Function(GetTracksByExperimentIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTracksByExperimentIdProvider._internal(
        (ref) => create(ref as GetTracksByExperimentIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        experimentId: experimentId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Track>> createElement() {
    return _GetTracksByExperimentIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTracksByExperimentIdProvider &&
        other.experimentId == experimentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, experimentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetTracksByExperimentIdRef on AutoDisposeStreamProviderRef<List<Track>> {
  /// The parameter `experimentId` of this provider.
  String get experimentId;
}

class _GetTracksByExperimentIdProviderElement
    extends AutoDisposeStreamProviderElement<List<Track>>
    with GetTracksByExperimentIdRef {
  _GetTracksByExperimentIdProviderElement(super.provider);

  @override
  String get experimentId =>
      (origin as GetTracksByExperimentIdProvider).experimentId;
}

String _$getTracksBySessionIdHash() =>
    r'688c33c2a9d8b5a51d00e734e372264d5b729e3e';

/// See also [getTracksBySessionId].
@ProviderFor(getTracksBySessionId)
const getTracksBySessionIdProvider = GetTracksBySessionIdFamily();

/// See also [getTracksBySessionId].
class GetTracksBySessionIdFamily extends Family<AsyncValue<List<Track>>> {
  /// See also [getTracksBySessionId].
  const GetTracksBySessionIdFamily();

  /// See also [getTracksBySessionId].
  GetTracksBySessionIdProvider call(
    String sessionId,
  ) {
    return GetTracksBySessionIdProvider(
      sessionId,
    );
  }

  @override
  GetTracksBySessionIdProvider getProviderOverride(
    covariant GetTracksBySessionIdProvider provider,
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
  String? get name => r'getTracksBySessionIdProvider';
}

/// See also [getTracksBySessionId].
class GetTracksBySessionIdProvider
    extends AutoDisposeStreamProvider<List<Track>> {
  /// See also [getTracksBySessionId].
  GetTracksBySessionIdProvider(
    String sessionId,
  ) : this._internal(
          (ref) => getTracksBySessionId(
            ref as GetTracksBySessionIdRef,
            sessionId,
          ),
          from: getTracksBySessionIdProvider,
          name: r'getTracksBySessionIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTracksBySessionIdHash,
          dependencies: GetTracksBySessionIdFamily._dependencies,
          allTransitiveDependencies:
              GetTracksBySessionIdFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  GetTracksBySessionIdProvider._internal(
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
    Stream<List<Track>> Function(GetTracksBySessionIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTracksBySessionIdProvider._internal(
        (ref) => create(ref as GetTracksBySessionIdRef),
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
  AutoDisposeStreamProviderElement<List<Track>> createElement() {
    return _GetTracksBySessionIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTracksBySessionIdProvider &&
        other.sessionId == sessionId;
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
mixin GetTracksBySessionIdRef on AutoDisposeStreamProviderRef<List<Track>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GetTracksBySessionIdProviderElement
    extends AutoDisposeStreamProviderElement<List<Track>>
    with GetTracksBySessionIdRef {
  _GetTracksBySessionIdProviderElement(super.provider);

  @override
  String get sessionId => (origin as GetTracksBySessionIdProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
