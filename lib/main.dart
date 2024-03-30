import 'package:flutter/material.dart';
import 'package:technorio/screen/entryPage.dart';
import 'package:technorio/screen/qr_Scanner_Page.dart';
import 'package:technorio/screen/stalls.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/stallScreen': (context) => StallScreen(),
          '/qrScannerPage': (context) => const QRScannerPage(),
        }));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EntryPage(), // Use EntryPage widget here
    );
  }
}
