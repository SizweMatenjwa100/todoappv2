import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoappv3/Homepage.dart';

void main() async {
  // Initialize Hive for Flutter
  await Hive.initFlutter();

  // Open a Hive box
  var box = await Hive.openBox("mybox");

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
