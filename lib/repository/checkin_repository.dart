import 'package:dio/dio.dart';

import '../helpers/exceptions.dart';
import '../model/checkin.dart';
import '../utils/url.dart';

abstract class CheckinRepository {
  Future<List<Checkin>> getStalls();
  Future<void> stallPost(
      {required int stallNumber, required String cardId, required String type});
}

class CheckinRepositoryImpl implements CheckinRepository {
  final Future<Dio> _dio;

  CheckinRepositoryImpl(this._dio);

  @override
  Future<List<Checkin>> getStalls() async {
    try {
      // Api
      final api = await APIUrls.getStallUrl();
      final response = await (await _dio).get(api);
      final data = response.data as List<dynamic>;
      final checkins = data.map((e) => Checkin.fromJson(e)).toList();
      // final checkins = [
      //   Checkin(type: 'Type 1', stall: [1, 2, 3, 4]),
      //   Checkin(type: 'Type 2', stall: [1, 2, 3]),
      // ];
      return checkins;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException(message: "Unauthorized");
      } else if (e.response?.statusCode == 400) {
        if (e.type.name == 'error') {
          throw ErrorException(message: e.message);
        } else {
          throw WarningException(message: e.message);
        }
      } else {
        throw NetworkException(message: 'Network Error');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> stallPost(
      {required int stallNumber,
      required String cardId,
      required String type}) async {
    try {
      // Api
      final api = await APIUrls.postCheckinUrl();

      final response = await (await _dio).post(api, data: {
        'stall': stallNumber,
        'card_id': cardId,
        'type': type,
      });

      response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException(message: "Unauthorized");
      } else if (e.response?.statusCode == 400) {
        if (e.type.name == 'error') {
          throw ErrorException(message: e.message);
        } else {
          throw WarningException(message: e.message);
        }
      } else {
        throw NetworkException(message: 'Network Error');
      }
    } catch (e) {
      rethrow;
    }
  }
}
