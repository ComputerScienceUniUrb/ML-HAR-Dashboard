// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTracksHash() => r'cafefe15b3128814227195ba9358a9d098046b57';

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
String _$getTracksByExperimentCodeHash() =>
    r'f44d7ea5747cf28af8b3a32537b266efab057e45';

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

/// See also [getTracksByExperimentCode].
@ProviderFor(getTracksByExperimentCode)
const getTracksByExperimentCodeProvider = GetTracksByExperimentCodeFamily();

/// See also [getTracksByExperimentCode].
class GetTracksByExperimentCodeFamily extends Family<AsyncValue<List<Track>>> {
  /// See also [getTracksByExperimentCode].
  const GetTracksByExperimentCodeFamily();

  /// See also [getTracksByExperimentCode].
  GetTracksByExperimentCodeProvider call(
    String code,
  ) {
    return GetTracksByExperimentCodeProvider(
      code,
    );
  }

  @override
  GetTracksByExperimentCodeProvider getProviderOverride(
    covariant GetTracksByExperimentCodeProvider provider,
  ) {
    return call(
      provider.code,
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
  String? get name => r'getTracksByExperimentCodeProvider';
}

/// See also [getTracksByExperimentCode].
class GetTracksByExperimentCodeProvider
    extends AutoDisposeStreamProvider<List<Track>> {
  /// See also [getTracksByExperimentCode].
  GetTracksByExperimentCodeProvider(
    String code,
  ) : this._internal(
          (ref) => getTracksByExperimentCode(
            ref as GetTracksByExperimentCodeRef,
            code,
          ),
          from: getTracksByExperimentCodeProvider,
          name: r'getTracksByExperimentCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTracksByExperimentCodeHash,
          dependencies: GetTracksByExperimentCodeFamily._dependencies,
          allTransitiveDependencies:
              GetTracksByExperimentCodeFamily._allTransitiveDependencies,
          code: code,
        );

  GetTracksByExperimentCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.code,
  }) : super.internal();

  final String code;

  @override
  Override overrideWith(
    Stream<List<Track>> Function(GetTracksByExperimentCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTracksByExperimentCodeProvider._internal(
        (ref) => create(ref as GetTracksByExperimentCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        code: code,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Track>> createElement() {
    return _GetTracksByExperimentCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTracksByExperimentCodeProvider && other.code == code;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, code.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetTracksByExperimentCodeRef
    on AutoDisposeStreamProviderRef<List<Track>> {
  /// The parameter `code` of this provider.
  String get code;
}

class _GetTracksByExperimentCodeProviderElement
    extends AutoDisposeStreamProviderElement<List<Track>>
    with GetTracksByExperimentCodeRef {
  _GetTracksByExperimentCodeProviderElement(super.provider);

  @override
  String get code => (origin as GetTracksByExperimentCodeProvider).code;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
