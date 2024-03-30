// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkin _$CheckinFromJson(Map<String, dynamic> json) => Checkin(
      password: json['password'] as String?,
      type: json['type'] as String?,
      card_id: json['card_id'] as String?,
      stall: json['stall'] as String?,
    );

Map<String, dynamic> _$CheckinToJson(Checkin instance) => <String, dynamic>{
      'password': instance.password,
      'type': instance.type,
      'card_id': instance.card_id,
      'stall': instance.stall,
    };
