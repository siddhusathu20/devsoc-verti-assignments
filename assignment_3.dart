import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 3',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> items = const [
    'Hollow Knight',
    'Hollow Knight: Silksong',
    'The Legend of Zelda: Breath of the Wild',
    'The Legend of Zelda: Tears of the Kingdom',
    'Minecraft',
    'Sekiro: Shadows Die Twice'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assignment 3 - ListViews'),),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (content, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Text(items[index]),
          );
        },
      ),
    );
  }
}