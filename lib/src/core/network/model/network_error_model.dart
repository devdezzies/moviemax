import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_error_model.g.dart';

@JsonSerializable()
class NetworkErrorModel extends Equatable {
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'status_message')
  final String? statusMessage;

  const NetworkErrorModel({required this.statusCode, required this.statusMessage});

  factory NetworkErrorModel.fromJson(Map<String, dynamic> json) {
    return _$NetworkkErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NetworkkErrorModelToJson(this);

  @override
  List<Object?> get props => [statusCode, statusMessage];
}