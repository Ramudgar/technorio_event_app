import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technorio/utils/url.dart';

class HttpServices {
  static Dio? _dio;

  static Future<Dio> getDioInstance() async {
    if (_dio == null) {
      final sharedPreferences = await SharedPreferences.getInstance();
      final baseUrl = await APIUrls.getBaseUrl(); // Await the base URL
      final password = sharedPreferences.getString('password') ?? '';
      final BaseOptions options = BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'password': password,
        },
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
      );
      _dio = Dio(options);
    }
    return _dio!;
  }
}
