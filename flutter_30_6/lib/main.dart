import 'package:flutter/material.dart';
import 'package:untitled/baitap02.dart';
import 'package:untitled/Example.dart';
import 'package:untitled/baitap01.dart';
import 'package:untitled/baitap03.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void main() {
    runApp(const MyApp());
  }

  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}