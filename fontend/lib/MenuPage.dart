import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, int> cart = {};  // Giỏ hàng lưu trữ món ăn và số lượng

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 tab cho 4 mục
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Bàn 28: Xin Chào"),
            Spacer(),
            Image.network(
              'https://storage.googleapis.com/a1aa/image/nis2wlnYbNJuCNJf1tqtI6oKFCQHz0kDT9QNsL4u6rMVT29JA.jpg',
              width: 40,
              height: 40,
            ),
          ],
        ),
        backgroundColor: Color(0xFFD32F2F),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Mỳ cay'),
            Tab(text: 'Đồ ăn thêm'),
            Tab(text: 'Đồ ăn nhẹ'),
            Tab(text: 'Nước uống'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildMenuList('Mỳ cay'),
          buildMenuList('Đồ ăn thêm'),
          buildMenuList('Đồ ăn nhẹ'),
          buildMenuList('Nước uống'),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => showCart(),
              ),
              Spacer(),
              Text('Tổng: ${getTotalPrice()}đ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: cart.isEmpty ? null : () {},  // Nút đặt món chỉ hoạt động khi có món
                child: Text('Đặt Món'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD32F2F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuList(String category) {
    List<Map<String, String>> menuItems = [];
    if (category == 'Mỳ cay') {
      menuItems = [
        {
          'title': 'Mì cay hải sản',
          'description': 'Có các thành phần xúc xích, cá viên, tôm, mực',
          'sales': '199 đã bán',
          'price': '35.000đ',
          'imageUrl': 'https://storage.googleapis.com/a1aa/image/8fCap14k2sSf0EObcNQuV0EIedihj1lrDfdDFJtMCyGnayuPB.jpg',
        },
        {
          'title': 'Mì cay xúc xích',
          'description': 'Có các thành phần xúc xích',
          'sales': '199 đã bán',
          'price': '35.000đ',
          'imageUrl': 'https://storage.googleapis.com/a1aa/image/Y9FN2EOJwspIMNlmAK4C5Ox0XpUTXgDqbsPTEIugQwtrJ7eJA.jpg',
        },
      ];
    } else if (category == 'Đồ ăn thêm') {
      menuItems = [
        {
          'title': 'Chả giò',
          'description': 'Chả giò giòn rụm, thơm ngon',
          'sales': '150 đã bán',
          'price': '20.000đ',
          'imageUrl': 'https://storage.googleapis.com/a1aa/image/spring_roll.jpg',
        },
        {
          'title': 'Bánh xèo',
          'description': 'Bánh xèo thơm phức, ăn kèm rau sống',
          'sales': '120 đã bán',
          'price': '25.000đ',
          'imageUrl': 'https://storage.googleapis.com/a1aa/image/banh_xeo.jpg',
        },
      ];
    } else if (category == 'Đồ ăn nhẹ') {
      menuItems = [
        {
          'title': 'Khoai tây chiên',
          'description': 'Khoai tây chiên giòn, thơm ngon',
          'sales': '200 đã bán',
          'price': '15.000đ',
          'imageUrl': 'https://storage.googleapis.com/a1aa/image/french_fries.jpg',
        },
        {
          'title': 'Gà rán',
          'description': 'Gà rán giòn rụm, ngọt thịt',
          'sales': '180 đã bán',
          'price': '30.000đ',
          'imageUrl': 'https://storage.googleapis.com/a1aa/image/fried_chicken.jpg',
        },
      ];
    } else if (category == 'Nước uống') {
      menuItems = [
        {
          'title': 'Nước ngọt',
          'description': 'Nước ngọt mát lạnh',
          'sales': '250 đã bán',
          'price': '12.000đ',
          'imageUrl': 'https://storage.googleapis.com/a1aa/image/soda.jpg',
        },
        {
          'title': 'Trà sữa',
          'description': 'Trà sữa thơm ngon',
          'sales': '300 đã bán',
          'price': '25.000đ',
          'imageUrl': 'https://storage.googleapis.com/a1aa/image/bubble_tea.jpg',
        },
      ];
    }

    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        var item = menuItems[index];
        return menuItem(item['title']!, item['description']!, item['sales']!, item['price']!, item['imageUrl']!, category);
      },
    );
  }

  Widget menuItem(String title, String description, String sales, String price, String imageUrl, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.network(imageUrl, width: 80, height: 80),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(description, style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text(sales, style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(price, style: TextStyle(fontSize: 16, color: Color(0xFFD32F2F), fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      if (cart.containsKey(title) && cart[title]! > 0) {
                        cart[title] = cart[title]! - 1;
                      }
                    });
                  },
                  color: Color(0xFFD32F2F),
                  iconSize: 30,
                ),
                Text(cart.containsKey(title) ? cart[title]!.toString() : "0", style: TextStyle(color: Color(0xFFD32F2F))),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      if (cart.containsKey(title)) {
                        cart[title] = cart[title]! + 1;
                      } else {
                        cart[title] = 1;
                      }
                    });
                  },
                  color: Color(0xFFD32F2F),
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Tính tổng giá trị giỏ hàng
  String getTotalPrice() {
    int total = 0;
    cart.forEach((title, quantity) {
      // Mô phỏng giá món ăn (có thể thay thế bằng giá thực tế từ dữ liệu)
      int price = 35000; // Bạn có thể thay đổi giá món ăn tương ứng
      total += price * quantity;
    });
    return total.toString();
  }

  // Hiển thị giỏ hàng
  void showCart() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Giỏ hàng'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cart.entries.map((entry) {
              return Text('${entry.key}: ${entry.value} món');
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}
