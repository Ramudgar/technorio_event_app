import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'checkin.g.dart';

@JsonSerializable()
class Checkin {
  String type;
  List<int> stall;

  Checkin({required this.type, required this.stall});

  //3. flutter pub run build_runner build
  factory Checkin.fromJson(Map<String, dynamic> json) {
    return _$CheckinFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckinToJson(this);
}
