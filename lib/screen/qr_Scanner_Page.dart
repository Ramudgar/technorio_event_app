import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:technorio/controllers/check_screen_controller.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  late final CheckInController _checkInController;
  String scannedData = '';

  @override
  void initState() {
    _checkInController = CheckInController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve stallName and eventTitle from the previous screen
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Extract stallName and eventTitle from the arguments
    final int stallName = args?['stallName'];
    final String eventTitle = args?['eventTitle'];

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner - $eventTitle - $stallName'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) => _onQRViewCreated(
                controller,
                stallNumber: stallName,
                type: eventTitle,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Scanned Data: $scannedData',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller,
      {required int stallNumber, required String type}) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedData = scanData.code!;
        if (scannedData.isNotEmpty) {
          _checkInController.stallPost(
            cardId: scannedData,
            stallNumber: stallNumber,
            type: type,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
