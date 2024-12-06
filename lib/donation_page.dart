import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationPage extends StatelessWidget {
  final String donationType;

  DonationPage({super.key, required this.donationType});

  final List<Map<String, String>> donationData = [
    {'name': 'Charity A', 'url': 'https://www.example.com/charityA'},
    {'name': 'Charity B', 'url': 'https://www.example.com/charityB'},
    {'name': 'Charity C', 'url': 'https://www.example.com/charityC'},
    {'name': 'Charity D', 'url': 'https://www.example.com/charityD'},
    {'name': 'Charity E', 'url': 'https://www.example.com/charityE'},
    {'name': 'Charity F', 'url': 'https://www.example.com/charityF'},
    {'name': 'Charity G', 'url': 'https://www.example.com/charityG'},
    {'name': 'Charity H', 'url': 'https://www.example.com/charityH'},
    {'name': 'Charity I', 'url': 'https://www.example.com/charityI'},
    {'name': 'Charity J', 'url': 'https://www.example.com/charityJ'},
    // Add more charities here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        title: Text('$donationType Donations', style: GoogleFonts.robotoSlab(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white), //Set back button icon to white
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: donationData.length,
          itemBuilder: (context, index) {
            final donation = donationData[index];
            return ListTile(
              title: Text(donation['name']!, style: GoogleFonts.robotoSlab(fontSize: 18, color: const Color(0xFF8B0000))),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to donation URL - Replace with actual navigation logic.
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8B0000)),
                child: const Text('Donate', style: TextStyle(color: Colors.white)),
              ),
            );
          },
        ),
      ),
    );
  }
}
