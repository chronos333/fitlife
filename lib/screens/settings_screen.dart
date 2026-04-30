import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/app_state.dart';

/// Tela de configurações do aplicativo.
/// Permite alterar preferências do usuário e controlar o estado global.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessa o estado global da aplicação (Provider)
    var app = Provider.of<AppState>(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // CONFIGURAÇÃO: MODO ESCURO
          Card(
            child: SwitchListTile(
              title: const Text("Modo escuro"),
              subtitle: const Text("Ativar tema escuro"),

              // Valor atual do tema (true = escuro, false = claro)
              value: app.isDarkMode,

              // Alterna o tema usando Provider
              onChanged: (_) => app.toggleTheme(),
            ),
          ),

          const SizedBox(height: 20),
          // CONFIGURAÇÃO: META SEMANAL
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Título da configuração
                  const Text(
                    "Meta semanal",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Controles para aumentar/diminuir a meta
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Diminuir meta
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),

                        // Chama função do Provider
                        onPressed: () => app.decreaseGoal(),
                      ),

                      // Valor atual da meta
                      Text(
                        "${app.weeklyGoal} atividades",
                        style: const TextStyle(fontSize: 20),
                      ),

                      // Aumentar meta
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),

                        // Chama função do Provider
                        onPressed: () => app.increaseGoal(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),
          // AÇÃO: RESETAR PROGRESSO
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text("Resetar progresso"),

            // Ao clicar, abre um diálogo de confirmação
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Resetar progresso?"),

                  content: const Text(
                    "Tem certeza que deseja resetar todo o progresso?",
                  ),

                  actions: [
                    // Cancela ação
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"),
                    ),

                    // Confirma reset
                    TextButton(
                      onPressed: () {
                        app.resetData(); // Limpa os dados via Provider
                        Navigator.pop(context);
                      },
                      child: const Text("Resetar"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
