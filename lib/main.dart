 import 'package:flutter/material.dart';

  void main() {
  runApp(MyApp());
  }

  class MyApp extends StatefulWidget {
    const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
  bool processRunning = false;
  List<ImageProvider> images = [];
  int? result;
  List<String> lists = [];

  void startProcess() {
  setState(() {
  processRunning = true;
  images = []; // Reset images in case they exist from a previous run
  });

  // Load 20 images from the internet
  for (int i = 0; i < 20; i++) {
  images.add(NetworkImage(
  'https://picsum.photos/200/300?image=$i',
  ));
  }

  // Simulate a complex calculation (Fibonacci)
  int fibonacci(int n) {
  if (n <= 1) {
  return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
  }

  setState(() {
  result = fibonacci(40);
  });

  // Add 100 elements to a list
  setState(() {
  lists = List.generate(100, (_) => '');
  });
  }

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  home: Scaffold(
  appBar: AppBar(
  title: Text('Flutter App'),
  ),
  body: SingleChildScrollView(
  child: Column(
  children: [
  Padding(
  padding: const EdgeInsets.all(20.0),
  child: ElevatedButton(
  onPressed: startProcess,
  child: Text('Start'),
  ),
  ),
  if (processRunning) ...[
  ...images.map((image) => Image(image: image)).toList(),
  Text(
  'Calculation completed: $result',
  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
  ...lists.map((list) => Text('Add element to list')).toList(),
  ],
  ],
  ),
  ),
  ),
  );
  }
  }
