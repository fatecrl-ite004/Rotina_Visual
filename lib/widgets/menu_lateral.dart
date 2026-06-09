import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  final String rotinaAtual;
  final Function(String) onRotinaSelecionada;

  const MenuLateral({
    super.key,
    required this.rotinaAtual,
    required this.onRotinaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    // Mock de rotinas (depois substitui por SQLite)
    final List<String> rotinas = ['Minha Rotina', 'Rotina da Tarde', 'Fim de Semana'];

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Cabeçalho do menu
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.calendar_today, size: 40),
                  const SizedBox(height: 8),
                  Text(
                    'Minhas Rotinas',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            
            // Lista de rotinas
            Expanded(
              child: ListView.builder(
                itemCount: rotinas.length,
                itemBuilder: (context, index) {
                  final rotina = rotinas[index];
                  final isAtual = rotina == rotinaAtual;
                  
                  return ListTile(
                    leading: Icon(
                      isAtual ? Icons.check_circle : Icons.circle_outlined,
                      color: isAtual ? Colors.green : null,
                    ),
                    title: Text(
                      rotina,
                      style: TextStyle(
                        fontWeight: isAtual ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    trailing: isAtual 
                        ? const Icon(Icons.visibility, size: 18)
                        : null,
                    onTap: () {
                      onRotinaSelecionada(rotina);
                    },
                  );
                },
              ),
            ),
            
            // Botão criar nova rotina
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('Criar nova rotina'),
              onTap: () {
                // Placeholder: abrir overlay para criar rotina
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Funcionalidade em desenvolvimento')),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}