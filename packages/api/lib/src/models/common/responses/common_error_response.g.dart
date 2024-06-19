// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommonErrorResponseImpl _$$CommonErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommonErrorResponseImpl(
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$CommonErrorResponseImplToJson(
        _$CommonErrorResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
