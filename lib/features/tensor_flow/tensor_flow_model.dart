import 'package:aifit_dashboard/core/data/converters.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tensor_flow_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TensorFlowModel extends Equatable {
  final String id;
  final String url;
  final bool enabled;
  final int version;
  final String? note;
  @TimestampConverter()
  final DateTime addedOn;

  const TensorFlowModel({
    required this.id,
    required this.url,
    required this.enabled,
    required this.version,
    required this.addedOn,
    this.note,
  });

  factory TensorFlowModel.fromJson(Map<String, dynamic> json) =>
      _$TensorFlowModelFromJson(json);

  Map<String, dynamic> toJson() => _$TensorFlowModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        url,
        enabled,
        version,
        addedOn,
        note,
      ];
}
