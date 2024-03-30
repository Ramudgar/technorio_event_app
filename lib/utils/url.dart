// class APIUrls {
//   // Define methods to generate other URLs as needed
//   static String getStallUrl(String eventCode, String baseUrl) {
//     return '$baseUrl/api/event/$eventCode/check-ins';
//   }

//   static String postCheckinUrl(String eventCode,String baseUrl) {
//     return '$baseUrl/api/event/$eventCode/check-in';
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';

class APIUrls {
  static Future<String> getBaseUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('url') ??
        ''; // If url is not available, return an empty string
  }

  static Future<String> getEventCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('eventCode') ??
        ''; // If eventCode is not available, return an empty string
  }

  static Future<String> getStallUrl() async {
    final baseUrl = await getBaseUrl();
    final eventCode = await getEventCode();
    return '$baseUrl/api/event/$eventCode/check-ins';
  }

  static Future<String> postCheckinUrl() async {
    final baseUrl = await getBaseUrl();
    final eventCode = await getEventCode();
    return '$baseUrl/api/event/$eventCode/check-ins';
  }
}
