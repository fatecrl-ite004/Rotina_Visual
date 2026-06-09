import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotina_visual/configuracoes_provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ConfiguracoesScreen extends StatelessWidget {
  const ConfiguracoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final configuracoes = context.watch<ConfiguracoesProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Título da seção aparencia
          const Text(
            'Aparência',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Card do tema escuro
          Card(
            child: SwitchListTile(
              title: const Text('Tema escuro'),
              subtitle: const Text(
                'Ativar e desativar o modo escuro',
              ),
              value: configuracoes.temaEscuro,
              onChanged: (_) {
                configuracoes.alternarTema();
              },
            ),
          ),

          // Card da cor de destaque
          Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                mostrarSeletorDeCor(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Cor de destaque',
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Selecione uma cor de destaque personalizada',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor:
                          configuracoes.corPrincipal,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Título da seção importação
          const Text(
            'Importação e compartilhamento de dados',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Funcionalidade em desenvolvimento',
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Importar rotina',
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Importa todas as suas rotinas apartir de um arquivo JSON.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Funcionalidade em desenvolvimento',
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exportar rotina',
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Exporta todas as suas rotinas para um arquivo JSON. Pode ser importada em outros dispositivos ou compartilhada com outras pessoas.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Título da seção notificações
          const Text(
            'Notificações',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Card(
            child: SwitchListTile(
              title: const Text(
                'Ativar notificações',
              ),
              subtitle: const Text(
                'Receber lembrete 5 minutos antes do término de uma atividade',
              ),
              value: false,
              onChanged: (value) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Funcionalidade em desenvolvimento',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Função para mostrar o seletor de cor
void mostrarSeletorDeCor(
  BuildContext context,
) {
  final configuracoes =
      context.read<ConfiguracoesProvider>();

  Color corSelecionada =
      configuracoes.corPrincipal;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'Escolha uma cor',
        ),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: corSelecionada,
            onColorChanged: (color) {
              corSelecionada = color;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancelar',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              configuracoes
                  .alterarCorPrincipal(
                corSelecionada,
              );

              Navigator.pop(context);
            },
            child: const Text(
              'Salvar',
            ),
          ),
        ],
      );
    },
  );
}