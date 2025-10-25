import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 2',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _textDisplay = 'Your text will appear here on clicking the reflect button!';
  
  void _updateDisplay() {
    setState(() {
      _textDisplay = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assignment 2 - TextFields'),),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter text here...',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Text(
              _textDisplay
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _updateDisplay, child: Text('Reflect!')
            ),
          ],
        ),
      ),
    );
  }
}