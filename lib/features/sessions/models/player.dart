import 'package:aifit_dashboard/core/data/converters.dart';
import 'package:aifit_dashboard/features/sessions/models/experiment_log.dart';
import 'package:aifit_dashboard/features/tracks/models/gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';

part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    @Default('Sconosciuto') String name,
    int? age,
    double? height,
    double? weight,
    Gender? gender,
    @TimestampConverter() DateTime? subscribedOn,
    @Default([]) List<ExperimentLog> experimentLogs,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
