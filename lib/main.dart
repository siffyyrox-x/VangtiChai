import 'package:flutter/material.dart';

void main() {
  runApp(const VangtiChaiApp());
}

class VangtiChaiApp extends StatelessWidget {
  const VangtiChaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VangtiChai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF267368),
          foregroundColor: Colors.white,
        ),
      ),
      home: const VangtiChaiScreen(),
    );
  }
}

class VangtiChaiScreen extends StatefulWidget {
  const VangtiChaiScreen({super.key});

  @override
  State<VangtiChaiScreen> createState() => _VangtiChaiScreenState();
}

class _VangtiChaiScreenState extends State<VangtiChaiScreen> {
  // Store the current amount entered by the user
  int totalAmount = 0;

  // Variables to hold count of each note denomination
  int note500 = 0;
  int note100 = 0;
  int note50 = 0;
  int note20 = 0;
  int note10 = 0;
  int note5 = 0;
  int note2 = 0;
  int note1 = 0;

  // Called when user presses any digit button (0-9)
  void pressDigit(int digit) {
    setState(() {
      totalAmount = totalAmount * 10 + digit;
      calculateNotes();
    });
  }

  // Called when user presses the CLEAR button
  void pressClear() {
    setState(() {
      totalAmount = 0;
      calculateNotes();
    });
  }

  // Calculates change breakdown for Taka notes
  void calculateNotes() {
    int remaining = totalAmount;

    note500 = remaining ~/ 500;
    remaining = remaining % 500;

    note100 = remaining ~/ 100;
    remaining = remaining % 100;

    note50 = remaining ~/ 50;
    remaining = remaining % 50;

    note20 = remaining ~/ 20;
    remaining = remaining % 20;

    note10 = remaining ~/ 10;
    remaining = remaining % 10;

    note5 = remaining ~/ 5;
    remaining = remaining % 5;

    note2 = remaining ~/ 2;
    remaining = remaining % 2;

    note1 = remaining;
  }

  @override
  Widget build(BuildContext context) {
    // Check orientation (Portrait vs Landscape)
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('VangtiChai'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top display area: "Taka:" or "Taka: 688"
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Text(
                  totalAmount == 0 ? 'Taka:' : 'Taka: $totalAmount',
                  style: const TextStyle(fontSize: 24, color: Colors.black87),
                ),
              ),

              // Main body switching between portrait and landscape
              Expanded(
                child: isPortrait ? buildPortraitLayout() : buildLandscapeLayout(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Layout for Portrait Mode
  Widget buildPortraitLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side: Single column notes list
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNoteText('500', note500),
              buildNoteText('100', note100),
              buildNoteText('50', note50),
              buildNoteText('20', note20),
              buildNoteText('10', note10),
              buildNoteText('5', note5),
              buildNoteText('2', note2),
              buildNoteText('1', note1),
            ],
          ),
        ),
        const SizedBox(width: 20),

        // Right side: Keypad (3 columns grid)
        Expanded(
          child: Column(
            children: [
              // Row 1: 1, 2, 3
              Row(
                children: [
                  Expanded(child: buildKey('1', () => pressDigit(1))),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('2', () => pressDigit(2))),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('3', () => pressDigit(3))),
                ],
              ),
              const SizedBox(height: 8),

              // Row 2: 4, 5, 6
              Row(
                children: [
                  Expanded(child: buildKey('4', () => pressDigit(4))),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('5', () => pressDigit(5))),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('6', () => pressDigit(6))),
                ],
              ),
              const SizedBox(height: 8),

              // Row 3: 7, 8, 9
              Row(
                children: [
                  Expanded(child: buildKey('7', () => pressDigit(7))),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('8', () => pressDigit(8))),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('9', () => pressDigit(9))),
                ],
              ),
              const SizedBox(height: 8),

              // Row 4: 0, CLEAR (CLEAR takes 2 columns width)
              Row(
                children: [
                  Expanded(child: buildKey('0', () => pressDigit(0))),
                  const SizedBox(width: 8),
                  Expanded(flex: 2, child: buildKey('CLEAR', pressClear)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Layout for Landscape Mode
  Widget buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side: Dual column notes list
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNoteText('500', note500),
                  buildNoteText('100', note100),
                  buildNoteText('50', note50),
                  buildNoteText('20', note20),
                ],
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNoteText('10', note10),
                  buildNoteText('5', note5),
                  buildNoteText('2', note2),
                  buildNoteText('1', note1),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),

        // Right side: Keypad (4 columns grid)
        Expanded(
          child: Column(
            children: [
              // Row 1: 1, 2, 3, 4
              Row(
                children: [
                  Expanded(child: buildKey('1', () => pressDigit(1), height: 45)),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('2', () => pressDigit(2), height: 45)),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('3', () => pressDigit(3), height: 45)),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('4', () => pressDigit(4), height: 45)),
                ],
              ),
              const SizedBox(height: 8),

              // Row 2: 5, 6, 7, 8
              Row(
                children: [
                  Expanded(child: buildKey('5', () => pressDigit(5), height: 45)),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('6', () => pressDigit(6), height: 45)),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('7', () => pressDigit(7), height: 45)),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('8', () => pressDigit(8), height: 45)),
                ],
              ),
              const SizedBox(height: 8),

              // Row 3: 9, 0, CLEAR (CLEAR takes 2 columns width)
              Row(
                children: [
                  Expanded(child: buildKey('9', () => pressDigit(9), height: 45)),
                  const SizedBox(width: 8),
                  Expanded(child: buildKey('0', () => pressDigit(0), height: 45)),
                  const SizedBox(width: 8),
                  Expanded(flex: 2, child: buildKey('CLEAR', pressClear, height: 45)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Simple helper to display note text like "500: 0"
  Widget buildNoteText(String noteLabel, int count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        '$noteLabel: $count',
        style: const TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }

  // Simple helper to build key button matching screenshot style
  Widget buildKey(String label, VoidCallback onTap, {double height = 55}) {
    return Container(
      height: height,
      color: const Color(0xFFD6D6D6),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
