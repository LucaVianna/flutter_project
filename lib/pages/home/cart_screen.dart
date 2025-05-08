import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(String) increaseQuantity;
  final Function(String) decreaseQuantity;
  final Function(String) removeFromCart;

  CartScreen({
    required this.cartItems,
    required this.increaseQuantity,
    required this.decreaseQuantity,
    required this.removeFromCart,
  });

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

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Image.asset(
                item['image'],
                width: 50,
                height: 50,
              ),
              title: Text(
                item['name'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                'R\$${item['price'].toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => decreaseQuantity(item['name']),
                  ),
                  Text(
                    '${item['quantity']}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => increaseQuantity(item['name']),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close, 
                      color: Colors.red,
                      size: 18,
                    ),
                    onPressed: () => removeFromCart(item['name']),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}