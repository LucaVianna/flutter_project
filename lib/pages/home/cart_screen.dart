import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Carrinho',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color(0xFF4AA66C),
      ),
      body: cartItems.isEmpty ? Center(
        child: Text(
          'Seu carrinho está vazio!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
      : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];

          return ListTile(
            leading: Image.asset(item['image'], width: 50, height: 50),
            title: Text(item['name']),
            subtitle: Text('R\$${item['price'].toStringAsFixed(2)}'),
          );
        },
      )
    );
  }
}