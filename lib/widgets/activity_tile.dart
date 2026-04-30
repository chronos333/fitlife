import 'package:flutter/material.dart';

/// Widget reutilizável para exibir uma atividade na lista.
/// Pode representar tanto atividades pendentes quanto concluídas.
class ActivityTile extends StatelessWidget {
  // Nome da atividade
  final String title;

  // Indica se a atividade já foi concluída
  final bool isCompleted;

  // Função executada ao clicar no botão (concluir ou desfazer)
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
      // Container visual para destacar cada item da lista
      child: ListTile(
        // Ícone à esquerda indicando status da atividade
        leading: Icon(
          isCompleted ? Icons.check_circle : Icons.circle,
          color: isCompleted ? Colors.green : Colors.grey,
        ),

        // Título da atividade
        title: Text(
          title,
          style: TextStyle(
            // Se concluída, risca o texto
            decoration:
                isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),

        // Botão à direita com ação dinâmica
        trailing: isCompleted
            // Caso já esteja concluída, permite desfazer
            ? IconButton(
                icon: const Icon(Icons.undo),
                tooltip: "Retornar para pendentes",
                onPressed: onTap,
              )
            // Caso esteja pendente, permite marcar como concluída
            : IconButton(
                icon: const Icon(Icons.check),
                tooltip: "Marcar como concluído",
                onPressed: onTap,
              ),
      ),
    );
  }
}
