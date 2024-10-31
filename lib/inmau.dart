import 'dart:math'; // Để tạo số ngẫu nhiên
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  // Mảng chứa các màu duy nhất
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.grey,
    Colors.purple,
    Colors.orange
  ];

  int _counter = 0;
  Color _currentColor = Colors.white; // Màu nền ban đầu

  // Hàm đổi màu nền
  void _changeBackgroundColor() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _currentColor = _colors[Random().nextInt(_colors.length)];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentColor, // Đặt màu nền từ _currentColor
      body: Center(
        child: ElevatedButton(
          onPressed: _changeBackgroundColor,
          child: Text('Nhấn để đổi màu nền'),
        ),
      ),
    );
  }
}
