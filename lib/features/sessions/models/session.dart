import 'package:aifit_dashboard/core/data/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

part 'session.g.dart';

enum SessionStatus { draft, opened, live, closed }

@freezed
class Session with _$Session {
  const factory Session({
    required String id,
    required String userId,
    required String name,
    String? selectedExperimentId,
    @Default([]) List<String> experiments,
    @Default(SessionStatus.opened) SessionStatus status,
    @TimestampConverter() required DateTime createdAt,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
