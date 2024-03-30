import 'package:dio/dio.dart';
import 'package:technorio/model/checkin.dart';

class CheckinApi {
  final Dio _dio; // Instance of Dio for making HTTP requests
  final String baseUrl; // Base URL of your API

  CheckinApi(this.baseUrl) : _dio = Dio();

  Future<Checkin> fetchCheckin(String id) async {
    try {
      final response = await _dio.get('$baseUrl/checkins/$id');
      return Checkin.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to fetch checkin: $error');
    }
  }

  Future<void> createCheckin(Checkin checkin) async {
    try {
      final response = await _dio.post(
        '$baseUrl/checkins',
        data: checkin.toJson(),
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to create checkin');
      }
    } catch (error) {
      throw Exception('Failed to create checkin: $error');
    }
  }

  // Add more methods for updating, deleting, etc. as needed
}
