import 'package:flutter/material.dart';

class StallScreen extends StatelessWidget {
  // Define event titles and corresponding stalls
  final List<String> eventTitles = ['Normal', 'Complex', 'Diamond'];

  final List<List<String>> stalls = [
    ['Stall 1', 'Stall 2', 'Stall 3'],
    ['Stall 4', 'Stall 5', 'Stall 6'],
    ['Stall 7', 'Stall 8', 'Stall 9'],
  ];

  StallScreen({super.key});

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
          itemCount: eventTitles.length,
          itemBuilder: (context, index) {
            return _buildExpansionTile(
                context, eventTitles[index], stalls[index]);
          },
        ),
      ),
    );
  }

// Function to build ExpansionTile for each event
  Widget _buildExpansionTile(
      BuildContext context, title, List<String> stallList) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      children:
          stallList.map((stall) => _buildStall(context, stall, title)).toList(),
    );
  }

// Function to build each stall
  Widget _buildStall(
      BuildContext context, String stallName, String eventTitle) {
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
          stallName,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
