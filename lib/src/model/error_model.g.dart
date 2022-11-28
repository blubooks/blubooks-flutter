// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      fields: json['fields'] as Map<String, dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'fields': instance.fields,
      'message': instance.message,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      ErrorModel.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
