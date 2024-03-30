// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkin _$CheckinFromJson(Map<String, dynamic> json) => Checkin(
      type: json['type'] as String,
      stall: (json['stall'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$CheckinToJson(Checkin instance) => <String, dynamic>{
      'type': instance.type,
      'stall': instance.stall,
    };
