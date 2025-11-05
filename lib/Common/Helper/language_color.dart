import 'package:flutter/material.dart';

class LanguageColor {
  static final Map<String, Color> colors = {
    'Dart': Colors.blue,
    'JavaScript': Colors.yellow,
    'TypeScript': Colors.blueAccent,
    'Python': Colors.green,
    'Java': Colors.orange,
    'Kotlin': Colors.purple,
    'Swift': Colors.orange,
    'Go': Colors.cyan,
    'Rust': Colors.deepOrange,
    'C++': Colors.pink,
    'C#': Colors.purple,
    'HTML': Colors.orange,
    'CSS': Colors.blue,
  };

  static Color get(String? language) {
    return colors[language] ?? Colors.grey;
  }
}