import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/app_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppState>(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Configuração de tema escuro via Provider
          Card(
            child: SwitchListTile(
              title: const Text("Modo escuro"),
              subtitle: const Text("Ativar tema escuro"),
              value: app.isDarkMode,
              onChanged: (_) => app.toggleTheme(),
            ),
          ),
          const SizedBox(height: 20),
          // Meta semanal editável com botões + e -
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Meta semanal",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () => app.decreaseGoal(),
                      ),
                      Text(
                        "${app.weeklyGoal} atividades",
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () => app.increaseGoal(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Resetar progresso?"),
                  content: const Text(
                    "Tem certeza que deseja resetar todo o progresso?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () {
                        app.resetData();
                        Navigator.pop(context);
                      },
                      child: const Text("Resetar"),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Resetar progresso"),
          ),
        ],
      ),
    );
  }
}