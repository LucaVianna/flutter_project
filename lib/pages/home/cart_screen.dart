import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
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
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void updateUI() {
    setState(() {
      // Forçando atualização da página
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Carrinho',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: widget.cartItems.isEmpty ? Center(
        child: Text(
          'Seu carrinho está vazio!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
      : ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];

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
                    onPressed: () {
                      widget.decreaseQuantity(item['name']);
                      updateUI();
                    }
                  ),
                  Text(
                    '${item['quantity']}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      widget.increaseQuantity(item['name']);
                      updateUI();
                    }
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close, 
                      color: Colors.red,
                      size: 18,
                    ),
                    onPressed: () {
                      widget.removeFromCart(item['name']);
                      updateUI();                    
                    }
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