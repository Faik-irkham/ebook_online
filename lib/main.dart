import 'package:ebook_online/page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebook App',
      theme: ThemeData(primarySwatch: Colors.yellow, fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
