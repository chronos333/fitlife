import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/app_state.dart';
import 'dashboard_screen.dart';
import 'activities_screen.dart';
import 'settings_screen.dart';

/// Tela principal do aplicativo.
/// Responsável por controlar a navegação entre as páginas
/// usando Drawer e BottomNavigationBar.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Lista de páginas exibidas conforme o índice selecionado
    const List<Widget> pages = [
      DashboardScreen(),
      ActivitiesScreen(),
      SettingsScreen(),
    ];

    // Acessa o estado global (Provider)
    var appState = Provider.of<AppState>(context);

    return Scaffold(
      /// Barra superior do aplicativo
      appBar: AppBar(
        title: const Text("FITLife"),

        // Ações da AppBar (lado direito)
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: "Notificações",

            // Exibe mensagem simples ao clicar
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Nenhuma notificação no momento."),
                ),
              );
            },
          ),
        ],
      ),

      /// Menu lateral (Drawer)
      drawer: Drawer(
        child: ListView(
          children: [
            // Cabeçalho do menu
            const DrawerHeader(
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// Navegação para Dashboard
            ListTile(
              title: const Text("Dashboard"),
              leading: const Icon(Icons.home),
              onTap: () {
                appState.changeTab(0);
                Navigator.pop(context);
              },
            ),

            /// Navegação para Atividades
            ListTile(
              title: const Text("Atividades"),
              leading: const Icon(Icons.list),
              onTap: () {
                appState.changeTab(1);
                Navigator.pop(context);
              },
            ),

            /// Navegação para Configurações
            ListTile(
              title: const Text("Configurações"),
              leading: const Icon(Icons.settings),
              onTap: () {
                appState.changeTab(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      /// Corpo principal: exibe a tela conforme o índice atual
      body: pages[appState.currentIndex],

      /// Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: appState.currentIndex,

        onTap: appState.changeTab,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Atividades",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Config",
          ),
        ],
      ),
    );
  }
}
