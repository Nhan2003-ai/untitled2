import 'package:flutter/material.dart';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}

  @override
}


  // Hàm kiểm tra số nguyên tố
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

    if (number == null) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kiểm Tra Số  Nguyên Tố')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Nhập một số',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Nút kiểm tra
            ElevatedButton(
            ),
          ],
        ),
      ),
    );
  }
}
