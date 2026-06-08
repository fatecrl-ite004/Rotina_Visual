import 'package:flutter/material.dart';
import '../models/atividade.dart';

class ItemAtividade extends StatelessWidget {
  final Atividade atividade;
  final bool modoApenasVisualizacao;
  final Function(Atividade) onEdit;
  final Function(Atividade) onDelete;

  const ItemAtividade({
    super.key,
    required this.atividade,
    required this.modoApenasVisualizacao,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: atividade.isMudanca ? Colors.orange[50] : null,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: atividade.pictogramaPath != null
              ? Image.asset(atividade.pictogramaPath!)
              : const Icon(Icons.access_time, size: 30),
        ),
        title: Text(
          atividade.nome,
          style: TextStyle(
            fontWeight: atividade.isMudanca ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(
          '${atividade.horarioInicio} - ${atividade.horarioTermino}',
        ),
        trailing: modoApenasVisualizacao
            ? null
            : PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (value) {
                  if (value == 'editar') {
                    onEdit(atividade);
                  } else if (value == 'excluir') {
                    _confirmarExclusao(context);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'editar',
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 18),
                        SizedBox(width: 8),
                        Text('Editar'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'excluir',
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Excluir', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _confirmarExclusao(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir atividade'),
        content: Text('Tem certeza que deseja excluir "${atividade.nome}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete(atividade);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Atividade excluída')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}