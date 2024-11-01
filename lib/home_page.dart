import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.translate, size: 20, color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(width: 8),
            
          ],
        ),
        backgroundColor: const Color(0xFF16B978),
        elevation: 0,
      ),
      body: Stack(
        clipBehavior: Clip.none, // Ensures widgets can overlap outside boundaries
        children: [
          BottomWidget(),
          MidWidget(),
          TopWidget(),
        ],
      ),
    );
  }

  Widget BottomWidget() {
    return Container(
      height: 150,
      color: const Color(0xFF16B978),
      padding: EdgeInsets.all(16),
      // margin: EdgeInsets.only(bottom: 50),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          'Online Soft Sell\nHello, Admin',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget MidWidget() {
    return Positioned(
      top: 100, // Adjust this to control how much overlap on green section
      left: 0,
      right: 0,
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              buildDashboardCard('CUSTOMERS', 'assets/images/customers.png'),
              buildDashboardCard('SUPPLIERS', 'assets/images/suppliers.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget TopWidget() {
    return Positioned(
      top: 250, // Start position for white background cards to avoid overlap
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDashboardCard('PRODUCTS', 'assets/images/products.jpg'),
                buildDashboardCard('POS', 'assets/images/pos.jpg'),
              ],
            ),
            SizedBox(height: 60), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDashboardCard('EXPENSE', 'assets/images/expense.jpg'),
                buildDashboardCard('ORDERS', 'assets/images/orders.jpg'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to create each dashboard card
  Widget buildDashboardCard(String title, String iconPath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 60,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_not_supported,
                  size: 60,
                  color: Colors.grey,
                );
              },
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
