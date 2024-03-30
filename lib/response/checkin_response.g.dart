// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckinResponse _$CheckinResponseFromJson(Map<String, dynamic> json) =>
    CheckinResponse(
      message: json['message'] as String,
      type: json['type'] as String,
      data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CheckinResponseToJson(CheckinResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': instance.type,
      'data': instance.data,
    };
