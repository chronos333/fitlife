import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/app_state.dart';
import '../widgets/activity_tile.dart';

/// Tela responsável por exibir e gerenciar as atividades físicas.
/// Possui duas abas: Pendentes e Concluídas.
class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessa o estado global da aplicação (Provider)
    var app = Provider.of<AppState>(context);

    return DefaultTabController(
      length: 2, // Define duas abas
      child: Column(
        children: [
          /// Barra de abas (TabBar)
          /// Permite alternar entre atividades pendentes e concluídas
          const TabBar(
            tabs: [
              Tab(text: "Pendentes"),
              Tab(text: "Concluídas"),
            ],
          ),

          /// Conteúdo das abas
          Expanded(
            child: TabBarView(
              children: [
                // ABA 1: ATIVIDADES PENDENTES
                app.pendingActivities.isEmpty
                    // Caso não haja atividades pendentes
                    ? const Center(
                        child: Text("Nenhuma atividade pendente!"),
                      )
                    : ListView(
                        // Lista dinâmica de atividades pendentes
                        children: app.pendingActivities.map((activity) {
                          return ActivityTile(
                            title: activity, // Nome da atividade
                            isCompleted: false, // Status pendente

                            // Ao clicar, marca como concluída
                            onTap: () =>
                                app.completeActivity(activity),
                          );
                        }).toList(),
                      ),
                // ABA 2: ATIVIDADES CONCLUÍDAS
                app.completedActivities.isEmpty
                    // Caso não haja atividades concluídas
                    ? const Center(
                        child:
                            Text("Nenhuma atividade concluída ainda!"),
                      )
                    : ListView(
                        // Lista dinâmica de atividades concluídas
                        children: app.completedActivities.map((activity) {
                          return ActivityTile(
                            title: activity, // Nome da atividade
                            isCompleted: true, // Status concluído

                            // Ao clicar, retorna para pendentes
                            onTap: () =>
                                app.uncompleteActivity(activity),
                          );
                        }).toList(),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
