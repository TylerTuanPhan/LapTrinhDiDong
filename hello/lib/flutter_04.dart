import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _bmiResult = "";
  bool isMale = true;  // Mặc định là nam

  void calculateBMI() {
    if (_weightController.text.isNotEmpty && _heightController.text.isNotEmpty) {
      final weight = double.parse(_weightController.text);
      final height = double.parse(_heightController.text) / 100; // Chuyển cm sang m

      double bmi = weight / (height * height); // Tính BMI
      String weightStatus;
      if (bmi < 18.5) {
        weightStatus = "Thiếu cân";
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        weightStatus = "Cân nặng bình thường";
      } else if (bmi >= 25 && bmi <= 29.9) {
        weightStatus = "Thừa cân";
      } else {
        weightStatus = "Béo phì";
      }

      // Tùy chỉnh thông điệp dựa trên giới tính
      String genderMessage = isMale ? "Bạn nam," : "Bạn nữ,";

      setState(() {
        _bmiResult = "$genderMessage BMI của bạn là ${bmi.toStringAsFixed(1)} - $weightStatus";
      });
    } else {
      setState(() {
        _bmiResult = "Vui lòng điền đầy đủ thông tin";
      });
    }
  }

  void clearAll() {
    _weightController.clear();
    _heightController.clear();
    setState(() {
      _bmiResult = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tính BMI'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cân nặng (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Chiều cao (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ToggleButtons(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Nam'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Nữ'),
                ),
              ],
              isSelected: [isMale, !isMale],
              onPressed: (int index) {
                setState(() {
                  isMale = index == 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Tính BMI'),
            ),
            SizedBox(height: 20),
            Text(
              _bmiResult,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: clearAll,
              child: Text('Xóa tất cả'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
