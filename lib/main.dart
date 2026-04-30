import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/app_state.dart';
import 'screens/splash_screen.dart';

/// Função principal da aplicação.
/// Inicializa o app e injeta o Provider global (AppState)
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(), // Cria o estado global da aplicação
      child: MyApp(), // Widget raiz do app
    ),
  );
}

/// Widget principal da aplicação.
/// Responsável por configurar o tema e a tela inicial
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém o estado global (Provider)
    var appState = Provider.of<AppState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove banner de debug

      // Define o tema dinamicamente (claro ou escuro)
      theme: appState.isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),

      // Define a tela inicial do aplicativo
      home: const SplashScreen(),
    );
  }
}
