import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 4',
      theme: ThemeData.dark(),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assignment 4 - Navigation (page 1)'),),
      body: Center(
        child: Column(
          children: [
            Text('This is page 1!'),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage())
                );
              },
              child: Text('Onwards and upwards!')
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assignment 4 - Navigation (page 2)'),),
      body: Center(
        child: Column(
          children: [
            Text('.xetrov eht otni dekcus tog gnirts siht ...ereh ni ssem a fo tib a s\'ti ,yrroS !2 egap si siht dnA'),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('I don\'t think I wanna be here anymore...')
            ),
          ],
        ),
      ),
    );
  }
}