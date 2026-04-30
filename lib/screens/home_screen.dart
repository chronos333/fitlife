import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/app_state.dart';
import 'dashboard_screen.dart';
import 'activities_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [
      DashboardScreen(),
      ActivitiesScreen(),
      SettingsScreen(),
    ];

    var appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("FITLife"),
        // Ícone de notificações na AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: "Notificações",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Nenhuma notificação no momento.")),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text("Dashboard"),
              leading: const Icon(Icons.home),
              onTap: () {
                appState.changeTab(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Atividades"),
              leading: const Icon(Icons.list),
              onTap: () {
                appState.changeTab(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Configurações"),
              leading: const Icon(Icons.settings),
              onTap: () {
                appState.changeTab(2);
                Navigator.pop(context);
              },
            ),
            // Item Ajuda adicionado conforme critério
            ListTile(
              title: const Text("Ajuda"),
              leading: const Icon(Icons.help),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Ajuda"),
                    content: const Text(
                      "FITLife ajuda você a acompanhar suas atividades físicas.\n\n"
                      "• Marque atividades como concluídas na aba Atividades.\n"
                      "• Acompanhe seu progresso no Dashboard.\n"
                      "• Ajuste suas configurações na aba Config.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Fechar"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: pages[appState.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: appState.currentIndex,
        onTap: appState.changeTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Atividades"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Config"),
        ],
      ),
    );
  }
}