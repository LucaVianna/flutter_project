import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Maçã', 'price': 7.99, 'image': 'assets/maca.jpg'},
    {'name': 'Banana', 'price': 11.99, 'image': 'assets/banana.jpg'},
    {'name': 'Cenoura', 'price': 6.99, 'image': 'assets/cenoura.jpg'},
    {'name': 'Tomate', 'price': 5.99, 'image': 'assets/tomate.jpg'}
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
            final product = products[index];

            return Card(
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
                      // Lógica para add ao carrinhos
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4AA66C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorar'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorito'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ]
      ),
    );
  }
}