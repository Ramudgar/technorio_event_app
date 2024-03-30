class CheckinResponse {
  final String message;
  final String type;
  final List<String> data;

  CheckinResponse({
    required this.message,
    required this.type,
    required this.data,
  });

  factory CheckinResponse.fromJson(Map<String, dynamic> json) {
    return CheckinResponse(
      message: json['message'],
      type: json['type'],
      data: List<String>.from(json['data']),
    );
  }

  @override
  String toString() {
    return 'CheckinResponse{ message: $message, type: $type, data: $data }';
  }
}
