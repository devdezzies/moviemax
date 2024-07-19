// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkErrorModel _$NetworkkErrorModelFromJson(Map<String, dynamic> json) =>
    NetworkErrorModel(
      statusCode: (json['status_code'] as num?)?.toInt(),
      statusMessage: json['status_message'] as String?,
    );

Map<String, dynamic> _$NetworkkErrorModelToJson(NetworkErrorModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
