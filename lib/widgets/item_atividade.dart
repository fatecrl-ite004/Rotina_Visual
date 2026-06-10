import 'package:flutter/material.dart';
import '../models/atividade.dart';

class ItemAtividade extends StatelessWidget {
  final Atividade atividade;
  final bool modoApenasVisualizacao;
  final Function(Atividade, Atividade) onEdit;
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
    final corPrincipal = Theme.of(context).primaryColor;
    final isTemaEscuro = Theme.of(context).brightness == Brightness.dark;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: atividade.isMudanca ? 2 : 1,
      
      // TEMA CLARO: fundo sólido na cor principal
      // TEMA ESCURO: fundo transparente com leve opacidade
      color: atividade.isMudanca
          ? (isTemaEscuro 
              ? corPrincipal.withOpacity(0.2) 
              : corPrincipal)  // ✅ Fundo sólido no claro!
          : null,
      
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            // TEMA CLARO: fundo branco/escuro dependendo do contraste
            // TEMA ESCURO: fundo com opacidade da cor principal
            color: atividade.isMudanca
                ? (isTemaEscuro
                    ? corPrincipal.withOpacity(0.4)
                    : Colors.white.withOpacity(0.95))  // ✅ Fundo branco no claro!
                : Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
            border: atividade.isMudanca && isTemaEscuro
                ? Border.all(color: corPrincipal.withOpacity(0.5), width: 1)
                : null,
          ),
          child: Center(
            child: atividade.pictogramaPath != null
                ? Image.asset(atividade.pictogramaPath!, fit: BoxFit.contain)
                : Icon(
                    atividade.isMudanca ? Icons.warning_amber_rounded : Icons.access_time,
                    size: 28,
                    // TEMA CLARO: ícone na cor principal (se for mudança)
                    // TEMA ESCURO: ícone branco ou cor principal
                    color: atividade.isMudanca
                        ? (isTemaEscuro ? corPrincipal : corPrincipal)
                        : null,
                  ),
          ),
        ),
        
        title: Row(
          children: [
            Expanded(
              child: Text(
                atividade.nome,
                style: TextStyle(
                  fontWeight: atividade.isMudanca ? FontWeight.bold : FontWeight.normal,
                  // TEMA CLARO: texto branco (fundo é colorido)
                  // TEMA ESCURO: texto normal
                  color: atividade.isMudanca && !isTemaEscuro
                      ? Colors.white
                      : null,
                  fontSize: 16,
                ),
              ),
            ),
            if (atividade.isMudanca)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  // TEMA CLARO: fundo branco com texto colorido
                  // TEMA ESCURO: fundo da cor principal
                  color: isTemaEscuro
                      ? corPrincipal
                      : Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 14,
                      color: isTemaEscuro ? Colors.white : corPrincipal,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Mudança',
                      style: TextStyle(
                        color: isTemaEscuro ? Colors.white : corPrincipal,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '${atividade.horarioInicio} - ${atividade.horarioTermino}',
            style: TextStyle(
              // TEMA CLARO: texto branco com leve transparência
              // TEMA ESCURO: cor normal
              color: atividade.isMudanca && !isTemaEscuro
                  ? Colors.white.withOpacity(0.85)
                  : (atividade.isMudanca ? corPrincipal : Colors.grey.shade600),
              fontSize: 13,
            ),
          ),
        ),
        
        trailing: modoApenasVisualizacao
            ? null
            : PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: atividade.isMudanca && !isTemaEscuro
                      ? Colors.white
                      : null,
                ),
                onSelected: (value) {
                  if (value == 'editar') {
                    onEdit(atividade, atividade);
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
    final isTemaEscuro = Theme.of(context).brightness == Brightness.dark;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir atividade'),
        content: Text('Tem certeza que deseja excluir "${atividade.nome}"?'),
        backgroundColor: isTemaEscuro ? Colors.grey.shade900 : Colors.white,
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