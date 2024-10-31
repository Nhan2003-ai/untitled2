import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeNumberChecker(),
    );
  }
}

class PrimeNumberChecker extends StatefulWidget {
  @override
  _PrimeNumberCheckerState createState() => _PrimeNumberCheckerState();
}

class _PrimeNumberCheckerState extends State<PrimeNumberChecker> {
  final TextEditingController _controller = TextEditingController();

  // Hàm kiểm tra số nguyên tố
  bool isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  // Hàm hiển thị Snackbar với kết quả
  void _showResult(BuildContext context) {
    final int? number = int.tryParse(_controller.text);
    if (number == null) {
      // Kiểm tra nhập liệu hợp lệ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng nhập một số hợp lệ')),
      );
      return;
    }

    // Kiểm tra số nguyên tố và hiển thị kết quả
    final resultText = isPrime(number)
        ? 'Số $number là số nguyên tố'
        : 'Số $number không phải là số nguyên tố';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(resultText)),
    );
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
            // Ô nhập số
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nhập một số',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            // Nút kiểm tra
            ElevatedButton(
              onPressed: () => _showResult(context),
              child: Text('Kiểm tra'),
            ),
          ],
        ),
      ),
    );
  }
}
