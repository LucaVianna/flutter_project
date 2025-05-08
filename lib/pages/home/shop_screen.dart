import 'package:flutter/material.dart';
import './product_screen.dart';

class ShopScreen extends StatefulWidget {
  final Function(Map<String, dynamic>, int) addToCart;

  ShopScreen({required this.addToCart});

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  // Define uma lista de produtos
  final List<Map<String, dynamic>> products = [
    {'name': 'Maçã', 'price': 7.99, 'descricao': 'Uma maça', 'image': 'assets/maca.jpg'},
    {'name': 'Banana', 'price': 11.99, 'descricao': 'Uma banana', 'image': 'assets/banana.jpg'},
    {'name': 'Cenoura', 'price': 6.99, 'descricao': 'Uma cenoura', 'image': 'assets/cenoura.jpg'},
    {'name': 'Tomate', 'price': 5.99, 'descricao': 'Um tomate', 'image': 'assets/tomate.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Shopping',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color(0xFF4AA66C),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            // Percorre a lista dos produtos
            final product = products[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(
                      product: product,
                      addToCart: widget.addToCart,
                    ))
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        product['image'],
                        fit: BoxFit.cover
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        product['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Text(
                      'R\$${product['price'].toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: () {
                        widget.addToCart({...product}, 1);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${product['name']} adicionado(a) ao carrinho!'))
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4AA66C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      )
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}