import 'package:json_annotation/json_annotation.dart';

part 'checkin.g.dart';

@JsonSerializable()
class Checkin {
  String? password;
  String? type;
  String? card_id;
  String? stall;

  Checkin({this.password, this.type, this.card_id, this.stall});

  //3. flutter pub run build_runner build
  factory Checkin.fromJson(Map<String, dynamic> json) {
    return _$CheckinFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckinToJson(this);
}
