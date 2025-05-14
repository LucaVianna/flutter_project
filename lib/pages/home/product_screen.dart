import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>, int) addToCart;

  ProductScreen({required this.product, required this.addToCart});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.product['image'],
                height: 200,
              ),
            ),
            SizedBox(height: 20),

            Text(
              widget.product['name'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            Text(
              'R\$${widget.product['price'].toStringAsFixed(2)} por unidade',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Descrição do produto',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            Text(
              widget.product['descricao'],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantidade',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });                         
                        }
                      }, 
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                            quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  widget.addToCart(widget.product, quantity);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  // Cor definida no ThemeData
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Adicionar ao Carrinho',
                  style: TextStyle(
                    fontSize: 18,
                    // Cor definida no ThemeData
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}