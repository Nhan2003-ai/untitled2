import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Máy Tính Cơ Bản')),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Khai báo TextEditingController để lấy dữ liệu từ TextField
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  // Biến lưu kết quả
  double _result = 0;

  // Hàm thực hiện các phép tính
  void _calculate(String operation) {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      if (operation == '+') {
        _result = num1 + num2;
      } else if (operation == '-') {
        _result = num1 - num2;
      } else if (operation == '*') {
        _result = num1 * num2;
      } else if (operation == '/') {
        _result = num2 != 0 ? num1 / num2 : 0; // Kiểm tra chia cho 0
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // TextField để nhập số thứ nhất
          TextField(
            controller: _num1Controller,
            decoration: InputDecoration(
              labelText: 'Số thứ nhất',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number, // Chỉ cho nhập số
          ),
          SizedBox(height: 10),
          // TextField để nhập số thứ hai
          TextField(
            controller: _num2Controller,
            decoration: InputDecoration(
              labelText: 'Số thứ hai',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          // Text hiển thị kết quả
          Text(
            'Kết quả: $_result',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          // 4 Button thực hiện phép tính
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _calculate('+'),
                child: Text('+'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('-'),
                child: Text('-'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('*'),
                child: Text('*'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('/'),
                child: Text('/'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
