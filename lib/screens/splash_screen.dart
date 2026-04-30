import 'package:flutter/material.dart';
import 'home_screen.dart';

/// Tela inicial (SplashScreen) do aplicativo.
/// Responsável por apresentar o app ao usuário antes de entrar no sistema.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Corpo centralizado na tela
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
          children: [
            // LOGO DO APLICATIVO
            Image.asset(
              'assets/images/logo.png', // Caminho da imagem nos assets
              width: 200,
              height: 200,
            ),

            const SizedBox(height: 20),

            // NOME DO APP
            const Text(
              "FITLife",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            // SLOGAN
            const Text(
              "Sua saúde em movimento",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),
            // BOTÃO DE ENTRADA
            ElevatedButton(
              onPressed: () {
                // Navega para a tela principal do app
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ),
                );
              },
              child: const Text("Começar"),
            ),
          ],
        ),
      ),
    );
  }
}
