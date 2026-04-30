import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/app_state.dart';
import '../widgets/activity_tile.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppState>(context);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: "Pendentes"),
              Tab(text: "Concluídas"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Aba 1: Atividades Pendentes
                app.pendingActivities.isEmpty
                    ? const Center(child: Text("Nenhuma atividade pendente!"))
                    : ListView(
                        children: app.pendingActivities.map((activity) {
                          // Reutilizando o widget ActivityTile
                          return ActivityTile(
                            title: activity,
                            isCompleted: false,
                            onTap: () => app.completeActivity(activity),
                          );
                        }).toList(),
                      ),
                // Aba 2: Atividades Concluídas
                app.completedActivities.isEmpty
                    ? const Center(child: Text("Nenhuma atividade concluída ainda!"))
                    : ListView(
                        children: app.completedActivities.map((activity) {
                          // Reutilizando o widget ActivityTile
                          return ActivityTile(
                            title: activity,
                            isCompleted: true,
                            onTap: () => app.uncompleteActivity(activity),
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