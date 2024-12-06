import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'donation_page.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _counter;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _counter = _generateRandomCounter();
    _startTimer();
  }

  int _generateRandomCounter() {
    final random = Random();
    return random.nextInt(50000) + 200000;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const threeSec = const Duration(seconds: 3);
    _timer = Timer.periodic(threeSec, (Timer timer) {
      _incrementCounter();
    });
  }

  void _incrementCounter() {
    final random = Random();
    final increment = random.nextInt(10) + 1;
    setState(() {
      _counter += increment;
    });
  }

  void _navigateToDonationPage(BuildContext context, String donationType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DonationPage(donationType: donationType),
      ),
    );
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Give Hope')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        title: const Text('Give Hope', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => _navigateToLoginPage(context),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                '₹ $_counter',
                style: GoogleFonts.robotoSlab(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF8B0000),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  DonationWidget(
                    icon: FaIcon(FontAwesomeIcons.virus, color: Colors.white, size: 60),
                    title: 'Disease',
                    onTap: () => _navigateToDonationPage(context, 'Disease'),
                  ),
                  DonationWidget(
                    icon: FaIcon(FontAwesomeIcons.fire, color: Colors.white, size: 60),
                    title: 'Disasters',
                    onTap: () => _navigateToDonationPage(context, 'Disasters'),
                  ),
                  DonationWidget(
                    icon: FaIcon(FontAwesomeIcons.house, color: Colors.white, size: 60),
                    title: 'Homeless Funds',
                    onTap: () => _navigateToDonationPage(context, 'Homeless Funds'),
                  ),
                  DonationWidget(
                    icon: FaIcon(FontAwesomeIcons.utensils, color: Colors.white, size: 60),
                    title: 'Food Banks',
                    onTap: () => _navigateToDonationPage(context, 'Food Banks'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonationWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;

  const DonationWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 10),
            Text(title, style: GoogleFonts.robotoSlab(color: Colors.white)), //Roboto Slab font
          ],
        ),
      ),
    );
  }
}
