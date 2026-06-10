import 'package:flutter/material.dart';
import '../models/rotina.dart';

class MenuLateral extends StatelessWidget {
  final List<Rotina> rotinas;
  final String rotinaAtualId;
  final Function(Rotina) onSelecionarRotina;
  final VoidCallback onCriarNovaRotina;
  final Function(Rotina) onExcluirRotina;

  const MenuLateral({
    super.key,
    required this.rotinas,
    required this.rotinaAtualId,
    required this.onSelecionarRotina,
    required this.onCriarNovaRotina,
    required this.onExcluirRotina,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.calendar_today, size: 40),
                  const SizedBox(height: 8),
                  Text(
                    'Minhas Rotinas',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${rotinas.length} rotina(s)',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: ListView.builder(
                itemCount: rotinas.length,
                itemBuilder: (context, index) {
                  final rotina = rotinas[index];
                  final isAtual = rotina.id == rotinaAtualId;
                  
                  return ListTile(
                    leading: Icon(
                      isAtual ? Icons.check_circle : Icons.circle_outlined,
                      color: isAtual ? Colors.green : null,
                    ),
                    title: Text(
                      rotina.nome,
                      style: TextStyle(
                        fontWeight: isAtual ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text(
                      '${rotina.atividades.length} atividade(s)',
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: isAtual
                        ? const Icon(Icons.visibility, size: 18)
                        : IconButton(
                            icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                            onPressed: () => _confirmarExclusao(context, rotina),
                          ),
                    onTap: isAtual ? null : () => onSelecionarRotina(rotina),
                  );
                },
              ),
            ),
            
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('Criar nova rotina'),
              onTap: onCriarNovaRotina,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _confirmarExclusao(BuildContext context, Rotina rotina) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir rotina'),
        content: Text('Tem certeza que deseja excluir "${rotina.nome}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onExcluirRotina(rotina);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}