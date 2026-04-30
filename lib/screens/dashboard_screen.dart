import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/app_state.dart';

/// Tela responsável por exibir o Dashboard do aplicativo.
/// Mostra métricas resumidas das atividades do usuário.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessa o estado global da aplicação (Provider)
    var app = Provider.of<AppState>(context);

    /// GridView utilizado para organizar os dados em formato de grade
    /// As informações são atualizadas automaticamente via Provider
    return GridView.count(
      crossAxisCount: 2, // Define 2 colunas
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 10, // Espaço vertical entre os cards
      crossAxisSpacing: 10, // Espaço horizontal entre os cards

      children: [
        // Card: total de atividades concluídas
        _card(
          "Concluídas",
          app.totalCompleted.toString(),
          Icons.check_circle,
        ),

        // Card: total de atividades pendentes
        _card(
          "Pendentes",
          app.totalPending.toString(),
          Icons.pending_actions,
        ),

        // Card: calorias estimadas com base nas atividades concluídas
        _card(
          "Calorias",
          "${app.calories} kcal",
          Icons.local_fire_department,
        ),

        // Card: tempo total de treino
        _card(
          "Tempo",
          "${app.totalTime} min",
          Icons.timer,
        ),

        // Card: meta semanal definida pelo usuário
        _card(
          "Meta",
          "${app.weeklyGoal} atividades",
          Icons.flag,
        ),
      ],
    );
  }

  /// Widget reutilizável para criar os cards do dashboard.
  /// Recebe título, valor e ícone como parâmetros.
  static Widget _card(String title, String value, IconData icon) {
    return Card(
      elevation: 4, // Sombra para dar destaque visual
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza conteúdo
          children: [
            // Ícone representativo da métrica
            Icon(icon, size: 30),

            const SizedBox(height: 10),

            // Título da métrica
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            // Valor da métrica
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
