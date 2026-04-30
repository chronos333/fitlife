import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/app_state.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppState>(context);

    // GridView com métricas atualizadas automaticamente via Provider
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        _card("Concluídas", app.totalCompleted.toString(), Icons.check_circle),
        _card("Pendentes", app.totalPending.toString(), Icons.pending_actions),
        // Ícone corrigido
        _card("Calorias", "${app.calories} kcal", Icons.local_fire_department),
        _card("Tempo", "${app.totalTime} min", Icons.timer),
        _card("Meta", "${app.weeklyGoal} atividades", Icons.flag),
      ],
    );
  }

  // Widget reutilizável de card para o dashboard
  static Widget _card(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}