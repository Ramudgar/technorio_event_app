
import 'package:json_annotation/json_annotation.dart';


part 'checkin_response.g.dart';

@JsonSerializable()
class CheckinResponse {
  final String message;
  final String type;
  final List<String> data;

  CheckinResponse({
    required this.message,
    required this.type,
    required this.data


  });

  factory CheckinResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckinResponseToJson(this);
}