import 'package:flutter/material.dart';

// Widget reutilizável para exibir uma atividade na lista
class ActivityTile extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final VoidCallback onTap;

  const ActivityTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          isCompleted ? Icons.check_circle : Icons.circle,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: isCompleted
            ? IconButton(
                icon: const Icon(Icons.undo),
                tooltip: "Retornar para pendentes",
                onPressed: onTap,
              )
            : IconButton(
                icon: const Icon(Icons.check),
                tooltip: "Marcar como concluído",
                onPressed: onTap,
              ),
      ),
    );
  }
}