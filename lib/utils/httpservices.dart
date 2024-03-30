import 'package:dio/dio.dart';
import 'package:technorio/utils/url.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices.internal();
  factory HttpServices() => _instance;
  HttpServices.internal();

  Dio? _dio;

  Future<Dio> getDioInstance() async {
    if (_dio == null) {
      final baseUrl = await APIUrls.getBaseUrl(); // Await the base URL
      _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
        ),
      );
    }
    return _dio!;
  }
}
