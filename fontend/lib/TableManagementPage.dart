import 'package:flutter/material.dart';

import 'MenuPage.dart';

class TableManagementPage extends StatelessWidget {
  // Danh sách 10 bàn
  final List<int> tableNumbers = List.generate(10, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý bàn"),
        backgroundColor: Color(0xFFD32F2F),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // Mỗi hàng có 5 bàn
          crossAxisSpacing: 150,
          mainAxisSpacing: 150,
        ),
        itemCount: tableNumbers.length,
        itemBuilder: (context, index) {
          int tableNumber = tableNumbers[index];
          return GestureDetector(
            onTap: () {
              // Khi người dùng bấm vào bàn, chuyển sang giao diện thực đơn
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(tableNumber: tableNumber),
                ),
              );
            },
            child: Card(
              color: Color(0xFFD32F2F),
              child: Center(
                child: Text(
                  'Bàn $tableNumber',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}