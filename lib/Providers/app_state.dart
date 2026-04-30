import 'package:flutter/material.dart';

// Gerenciamento de estado global do aplicativo FITLife
class AppState extends ChangeNotifier {
  // Lista de atividades pendentes
  List<String> pendingActivities = [
    "Caminhada",
    "Corrida",
    "Musculação",
    "Alongamento",
    "Yoga",
  ];

  // Lista de atividades concluídas
  List<String> completedActivities = [];

  // Índice da aba atual no BottomNavigationBar
  int currentIndex = 0;

  // Controle de tema
  bool isDarkMode = false;

  // Meta semanal de atividades
  int weeklyGoal = 5;

  // Move atividade de pendentes para concluídas
  void completeActivity(String activity) {
    pendingActivities.remove(activity);
    completedActivities.add(activity);
    notifyListeners();
  }

  // Move atividade de concluídas de volta para pendentes
  void uncompleteActivity(String activity) {
    completedActivities.remove(activity);
    pendingActivities.add(activity);
    notifyListeners();
  }

  // Altera a aba ativa no BottomNavigationBar
  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }

  // Alterna entre tema claro e escuro
  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  // Aumenta a meta semanal (máximo 14)
  void increaseGoal() {
    if (weeklyGoal < 14) {
      weeklyGoal++;
      notifyListeners();
    }
  }

  // Diminui a meta semanal (mínimo 1)
  void decreaseGoal() {
    if (weeklyGoal > 1) {
      weeklyGoal--;
      notifyListeners();
    }
  }

  // Reseta todas as atividades para o estado inicial
  void resetData() {
    pendingActivities = [
      "Caminhada",
      "Corrida",
      "Musculação",
      "Alongamento",
      "Yoga",
    ];
    completedActivities.clear();
    notifyListeners();
  }

  // Métricas calculadas automaticamente com base nas atividades concluídas
  int get totalCompleted => completedActivities.length;
  int get totalPending => pendingActivities.length;
  int get calories => completedActivities.length * 60;
  int get totalTime => completedActivities.length * 30;
}