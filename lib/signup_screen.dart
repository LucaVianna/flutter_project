import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Pequena cenoura
            SizedBox(
              height: 65,
              width: 65,
              child: Image.asset(
                'assets/carrot-preta-transparente.png'
              ),
            ),
            SizedBox(height: 5),

            // Título
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),

            // Subtítulo
            Text(
              'Identifique-se para continuar',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Campo de nome do usário
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),

            // Campo de email do usuário
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),

            // Campo de senha do usuário
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),

            // Checkbox para aceitar termos
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (newValue) {
                    // Implementar lógica
                  },
                ),
                Text(
                  'Concordar com os Termos e Condições'
                ),
              ],
            ),
            SizedBox(height: 15),

            // Botão de cadastro
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Implementar lógica
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4AA66C),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Cadastrar-se',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Link para login
            GestureDetector(
              onTap: () {
                // Navegação para tela de login
              },
              child: Text(
                'Já possui uma conta? Entrar',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}