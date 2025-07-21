// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_steps_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSessionStepsHash() => r'074698fd7150fb097c558136cca6316ea3ff0b1e';

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

/// See also [getSessionSteps].
@ProviderFor(getSessionSteps)
const getSessionStepsProvider = GetSessionStepsFamily();

/// See also [getSessionSteps].
class GetSessionStepsFamily extends Family<AsyncValue<List<SessionStep>>> {
  /// See also [getSessionSteps].
  const GetSessionStepsFamily();

  /// See also [getSessionSteps].
  GetSessionStepsProvider call(
    String sessionId,
  ) {
    return GetSessionStepsProvider(
      sessionId,
    );
  }

  @override
  GetSessionStepsProvider getProviderOverride(
    covariant GetSessionStepsProvider provider,
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
  String? get name => r'getSessionStepsProvider';
}

/// See also [getSessionSteps].
class GetSessionStepsProvider
    extends AutoDisposeStreamProvider<List<SessionStep>> {
  /// See also [getSessionSteps].
  GetSessionStepsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => getSessionSteps(
            ref as GetSessionStepsRef,
            sessionId,
          ),
          from: getSessionStepsProvider,
          name: r'getSessionStepsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSessionStepsHash,
          dependencies: GetSessionStepsFamily._dependencies,
          allTransitiveDependencies:
              GetSessionStepsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  GetSessionStepsProvider._internal(
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
    Stream<List<SessionStep>> Function(GetSessionStepsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSessionStepsProvider._internal(
        (ref) => create(ref as GetSessionStepsRef),
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
  AutoDisposeStreamProviderElement<List<SessionStep>> createElement() {
    return _GetSessionStepsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSessionStepsProvider && other.sessionId == sessionId;
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
mixin GetSessionStepsRef on AutoDisposeStreamProviderRef<List<SessionStep>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GetSessionStepsProviderElement
    extends AutoDisposeStreamProviderElement<List<SessionStep>>
    with GetSessionStepsRef {
  _GetSessionStepsProviderElement(super.provider);

  @override
  String get sessionId => (origin as GetSessionStepsProvider).sessionId;
}

String _$getExperimentStepsHash() =>
    r'bfc0d1b2307629fec9c5705af93f33e43b0d3032';

/// See also [getExperimentSteps].
@ProviderFor(getExperimentSteps)
const getExperimentStepsProvider = GetExperimentStepsFamily();

/// See also [getExperimentSteps].
class GetExperimentStepsFamily extends Family<AsyncValue<List<SessionStep>>> {
  /// See also [getExperimentSteps].
  const GetExperimentStepsFamily();

  /// See also [getExperimentSteps].
  GetExperimentStepsProvider call(
    String sessionId,
  ) {
    return GetExperimentStepsProvider(
      sessionId,
    );
  }

  @override
  GetExperimentStepsProvider getProviderOverride(
    covariant GetExperimentStepsProvider provider,
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
  String? get name => r'getExperimentStepsProvider';
}

/// See also [getExperimentSteps].
class GetExperimentStepsProvider
    extends AutoDisposeStreamProvider<List<SessionStep>> {
  /// See also [getExperimentSteps].
  GetExperimentStepsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => getExperimentSteps(
            ref as GetExperimentStepsRef,
            sessionId,
          ),
          from: getExperimentStepsProvider,
          name: r'getExperimentStepsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getExperimentStepsHash,
          dependencies: GetExperimentStepsFamily._dependencies,
          allTransitiveDependencies:
              GetExperimentStepsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  GetExperimentStepsProvider._internal(
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
    Stream<List<SessionStep>> Function(GetExperimentStepsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetExperimentStepsProvider._internal(
        (ref) => create(ref as GetExperimentStepsRef),
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
  AutoDisposeStreamProviderElement<List<SessionStep>> createElement() {
    return _GetExperimentStepsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetExperimentStepsProvider && other.sessionId == sessionId;
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
mixin GetExperimentStepsRef on AutoDisposeStreamProviderRef<List<SessionStep>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GetExperimentStepsProviderElement
    extends AutoDisposeStreamProviderElement<List<SessionStep>>
    with GetExperimentStepsRef {
  _GetExperimentStepsProviderElement(super.provider);

  @override
  String get sessionId => (origin as GetExperimentStepsProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
