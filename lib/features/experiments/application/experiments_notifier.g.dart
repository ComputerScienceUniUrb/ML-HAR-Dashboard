// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiments_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listenExperimentsHash() => r'6612dd61920cb55a12fce575505c7e68d1783c1a';

/// See also [listenExperiments].
@ProviderFor(listenExperiments)
final listenExperimentsProvider =
    AutoDisposeStreamProvider<List<Experiment>>.internal(
  listenExperiments,
  name: r'listenExperimentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listenExperimentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ListenExperimentsRef = AutoDisposeStreamProviderRef<List<Experiment>>;
String _$listenExperimentHash() => r'0356536696a71a38f37d65e98af13307ada00426';

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

/// See also [listenExperiment].
@ProviderFor(listenExperiment)
const listenExperimentProvider = ListenExperimentFamily();

/// See also [listenExperiment].
class ListenExperimentFamily extends Family<AsyncValue<Experiment>> {
  /// See also [listenExperiment].
  const ListenExperimentFamily();

  /// See also [listenExperiment].
  ListenExperimentProvider call(
    String experimentId,
  ) {
    return ListenExperimentProvider(
      experimentId,
    );
  }

  @override
  ListenExperimentProvider getProviderOverride(
    covariant ListenExperimentProvider provider,
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
  String? get name => r'listenExperimentProvider';
}

/// See also [listenExperiment].
class ListenExperimentProvider extends AutoDisposeStreamProvider<Experiment> {
  /// See also [listenExperiment].
  ListenExperimentProvider(
    String experimentId,
  ) : this._internal(
          (ref) => listenExperiment(
            ref as ListenExperimentRef,
            experimentId,
          ),
          from: listenExperimentProvider,
          name: r'listenExperimentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listenExperimentHash,
          dependencies: ListenExperimentFamily._dependencies,
          allTransitiveDependencies:
              ListenExperimentFamily._allTransitiveDependencies,
          experimentId: experimentId,
        );

  ListenExperimentProvider._internal(
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
    Stream<Experiment> Function(ListenExperimentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListenExperimentProvider._internal(
        (ref) => create(ref as ListenExperimentRef),
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
  AutoDisposeStreamProviderElement<Experiment> createElement() {
    return _ListenExperimentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListenExperimentProvider &&
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
mixin ListenExperimentRef on AutoDisposeStreamProviderRef<Experiment> {
  /// The parameter `experimentId` of this provider.
  String get experimentId;
}

class _ListenExperimentProviderElement
    extends AutoDisposeStreamProviderElement<Experiment>
    with ListenExperimentRef {
  _ListenExperimentProviderElement(super.provider);

  @override
  String get experimentId => (origin as ListenExperimentProvider).experimentId;
}

String _$getExperimentByIdHash() => r'f09e5b996fff4c343bddf8875947acfc899b3795';

/// See also [getExperimentById].
@ProviderFor(getExperimentById)
const getExperimentByIdProvider = GetExperimentByIdFamily();

/// See also [getExperimentById].
class GetExperimentByIdFamily extends Family<AsyncValue<Experiment?>> {
  /// See also [getExperimentById].
  const GetExperimentByIdFamily();

  /// See also [getExperimentById].
  GetExperimentByIdProvider call(
    String experimentId,
  ) {
    return GetExperimentByIdProvider(
      experimentId,
    );
  }

  @override
  GetExperimentByIdProvider getProviderOverride(
    covariant GetExperimentByIdProvider provider,
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
  String? get name => r'getExperimentByIdProvider';
}

/// See also [getExperimentById].
class GetExperimentByIdProvider extends AutoDisposeFutureProvider<Experiment?> {
  /// See also [getExperimentById].
  GetExperimentByIdProvider(
    String experimentId,
  ) : this._internal(
          (ref) => getExperimentById(
            ref as GetExperimentByIdRef,
            experimentId,
          ),
          from: getExperimentByIdProvider,
          name: r'getExperimentByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getExperimentByIdHash,
          dependencies: GetExperimentByIdFamily._dependencies,
          allTransitiveDependencies:
              GetExperimentByIdFamily._allTransitiveDependencies,
          experimentId: experimentId,
        );

  GetExperimentByIdProvider._internal(
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
    FutureOr<Experiment?> Function(GetExperimentByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetExperimentByIdProvider._internal(
        (ref) => create(ref as GetExperimentByIdRef),
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
  AutoDisposeFutureProviderElement<Experiment?> createElement() {
    return _GetExperimentByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetExperimentByIdProvider &&
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
mixin GetExperimentByIdRef on AutoDisposeFutureProviderRef<Experiment?> {
  /// The parameter `experimentId` of this provider.
  String get experimentId;
}

class _GetExperimentByIdProviderElement
    extends AutoDisposeFutureProviderElement<Experiment?>
    with GetExperimentByIdRef {
  _GetExperimentByIdProviderElement(super.provider);

  @override
  String get experimentId => (origin as GetExperimentByIdProvider).experimentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
