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
    return prefs.getString('url') ?? ''; // If url is not available, return an empty string
  }

  static Future<String> getStallUrl(String eventCode) async {
    final baseUrl = await getBaseUrl();
    return '$baseUrl/api/event/$eventCode/check-ins';
  }

  static Future<String> postCheckinUrl(String eventCode) async {
    final baseUrl = await getBaseUrl();
    return '$baseUrl/api/event/$eventCode/check-in';
  }
}
