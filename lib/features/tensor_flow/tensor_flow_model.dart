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
  final String? notes;
  final String fileName;
  @TimestampConverter()
  final DateTime? addedOn;
  @TimestampConverter()
  final DateTime? trainedOn;

  const TensorFlowModel({
    required this.id,
    required this.url,
    required this.enabled,
    required this.version,
    required this.addedOn,
    required this.fileName,
    this.trainedOn,
    this.notes,
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
        notes,
      ];
}
