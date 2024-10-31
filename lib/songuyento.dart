import 'package:flutter/material.dart';

void main() => runApp(PrimeCheckerApp());

class PrimeCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeCheckerScreen(),
    );
  }
}

class PrimeCheckerScreen extends StatefulWidget {
  @override
  _PrimeCheckerScreenState createState() => _PrimeCheckerScreenState();
}

class _PrimeCheckerScreenState extends State<PrimeCheckerScreen> {
  final TextEditingController _numberController = TextEditingController();
  String _result = '';

  // Hàm kiểm tra số nguyên tố
  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  // Hàm xử lý sự kiện kiểm tra số
  void _checkPrime() {
    int? number = int.tryParse(_numberController.text);
    setState(() {
      if (number == null) {
        _result = 'Vui lòng nhập một số hợp lệ';
      } else if (_isPrime(number)) {
        _result = 'Số $number là số nguyên tố';
      } else {
        _result = 'Số $number không phải là số nguyên tố';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kiểm Tra Số Nguyên Tố')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextField để nhập số
            TextField(
              controller: _numberController,
              decoration: InputDecoration(
                labelText: 'Nhập một số',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number, // Chỉ cho phép nhập số
            ),
            SizedBox(height: 20),
            // Nút kiểm tra
            ElevatedButton(
              onPressed: _checkPrime,
              child: Text('Kiểm Tra'),
            ),
            SizedBox(height: 20),
            // Text hiển thị kết quả
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
