import 'package:flutter/material.dart';
import 'package:technorio/controllers/check_screen_controller.dart';
import 'package:technorio/model/checkin.dart';

class StallScreen extends StatefulWidget {
  const StallScreen({super.key});

  @override
  State<StallScreen> createState() => _StallScreenState();
}

class _StallScreenState extends State<StallScreen> {
  List<Checkin> stallsList = [];
  late final CheckInController _checkInController;

  @override
  void initState() {
    _checkInController = CheckInController();
    fetchStalls();
    super.initState();
  }

  fetchStalls() async {
    stallsList = await _checkInController.fetchStalls();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stalls'),
        backgroundColor: const Color.fromARGB(0, 61, 98, 218),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 52, 141, 181),
              Color.fromARGB(255, 82, 146, 127),
              Color.fromARGB(255, 120, 171, 113),
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: stallsList.length,
          itemBuilder: (context, index) {
            return _buildExpansionTile(
              context,
              stallsList[index].type,
              stallsList[index].stall,
              stallsList[index].type,
            );
          },
        ),
      ),
    );
  }

// Function to build ExpansionTile for each event
  Widget _buildExpansionTile(
      BuildContext context, title, List<int> stallList, String type) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      children:
          stallList.map((stall) => _buildStall(context, stall, type)).toList(),
    );
  }

// Function to build each stall
  Widget _buildStall(BuildContext context, int stallName, String eventTitle) {
    return GestureDetector(
      onTap: () {
        // Navigate to QRScannerPage when a stall is tapped
        Navigator.pushNamed(context, '/qrScannerPage', arguments: {
          'stallName': stallName,
          'eventTitle': eventTitle,
        });
        debugPrint('Navigating to QRScannerPage, $stallName, $eventTitle');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          stallName.toString(),
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
