import 'package:flutter/material.dart';
import 'features.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sliding_pages(),
    );
  }
}
