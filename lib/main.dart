import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technorio/screen/entryPage.dart';
import 'package:technorio/screen/qr_Scanner_Page.dart';
import 'package:technorio/screen/stalls.dart';

late String baseUrlPRO; // Declare baseUrlPRO as a global variable

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized
  SharedPreferences prefs = await SharedPreferences.getInstance();
  baseUrlPRO =
      prefs.getString('url') ?? ""; // Retrieve base URL from SharedPreferences
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(), // Use HomePage widget here
      '/stallScreen': (context) => StallScreen(),
      '/qrScannerPage': (context) => const QRScannerPage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EntryPage(), // Use EntryPage widget here
    );
  }
}
