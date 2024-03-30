import 'package:technorio/api/checkin_api.dart';
import 'package:technorio/model/checkin.dart';

class CheckinRepository {
  final CheckinApi _checkinApi;

  CheckinRepository(this._checkinApi);

  Future<Checkin> fetchCheckin(String id) async {
    try {
      return await _checkinApi.fetchCheckin(id);
    } catch (error) {
      throw Exception('Failed to fetch checkin: $error');
    }
  }

  Future<void> createCheckin(Checkin checkin) async {
    try {
      await _checkinApi.createCheckin(checkin);
    } catch (error) {
      throw Exception('Failed to create checkin: $error');
    }
  }

  // Add more methods for updating, deleting, etc. as needed
}
