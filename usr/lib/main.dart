import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Index Table',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IndexTablePage(),
      },
    );
  }
}

class IndexTablePage extends StatelessWidget {
  const IndexTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'INDEX',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Table(
                border: TableBorder.all(color: Colors.black, width: 1),
                columnWidths: const {
                  0: FixedColumnWidth(70), // Si.No
                  1: FlexColumnWidth(),    // Topic
                  2: FixedColumnWidth(90), // Page No
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  // Header
                  _buildTableRow('Si. No', 'Topic', 'Page No', isHeader: true),
                  // Rows 1-7 (Inferred structure as placeholders)
                  _buildTableRow('1', 'Introduction', '1'),
                  _buildTableRow('2', 'Literature Review', '5'),
                  _buildTableRow('3', 'System Analysis', '12'),
                  _buildTableRow('4', 'System Design', '18'),
                  _buildTableRow('5', 'Implementation', '24'),
                  _buildTableRow('6', 'Testing', '32'),
                  _buildTableRow('7', 'Conclusion', '36'),
                  // Row 8 (Requested specific row)
                  _buildTableRow('8', 'Bibliography', '38'),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  TableRow _buildTableRow(String col1, String col2, String col3, {bool isHeader = false}) {
    final style = TextStyle(
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      fontSize: 16,
      color: Colors.black,
    );
    
    return TableRow(
      decoration: isHeader ? const BoxDecoration(color: Color(0xFFEEEEEE)) : null,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(col1, style: style, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(col2, style: style, textAlign: TextAlign.left),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(col3, style: style, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
