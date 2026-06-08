import 'package:flutter/material.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/overlay_nova_atividade.dart';
import '../widgets/item_atividade.dart';
import '../models/atividade.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock de atividades para teste (depois substitui por SQLite)
  List<Atividade> _atividades = [];

  // Controle do modo de visualização
  bool _modoApenasVisualizacao = false;

  // Controle do menu lateral
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      
      // Drawer (menu lateral)
      drawer: MenuLateral(
        rotinaAtual: "Minha Rotina",
        onRotinaSelecionada: (nomeRotina) {
          // Placeholder: futuramente carregar rotina selecionada
          setState(() {
            // Lógica para trocar rotina
          });
          Navigator.pop(context);
        },
      ),
      
      // AppBar
      appBar: AppBar(
        title: const Text(
          'Rotina Visual',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          tooltip: 'Ver rotinas',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Placeholder: navegar para configurações
              Navigator.pushNamed(context, '/configuracoes');
            },
            tooltip: 'Configurações',
          ),
        ],
      ),
      
      // Corpo da página (lista de atividades)
      body: _atividades.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Clique em + para criar uma nova atividade',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _atividades.length,
              itemBuilder: (context, index) {
                return ItemAtividade(
                  atividade: _atividades[index],
                  modoApenasVisualizacao: _modoApenasVisualizacao,
                  onEdit: (atividade) {
                    // Placeholder: editar atividade
                  },
                  onDelete: (atividade) {
                    setState(() {
                      _atividades.remove(atividade);
                    });
                  },
                );
              },
            ),
      
      // BottomNavigationBar (footer)
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Botão esquerdo: ativar modo apenas visualização
            IconButton(
              icon: Icon(
                _modoApenasVisualizacao ? Icons.visibility_off : Icons.visibility,
                size: 32,
                color: _modoApenasVisualizacao 
                    ? Colors.orange 
                    : Colors.grey[600],
              ),
              onPressed: () {
                setState(() {
                  _modoApenasVisualizacao = !_modoApenasVisualizacao;
                });
                // Placeholder: mostrar snackbar informando
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _modoApenasVisualizacao 
                          ? 'Modo de apenas visualização ativado' 
                          : 'Modo de visualização desativado',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              tooltip: 'Modo apenas visualização',
            ),
            
            // Botão central (+)
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 32,
                  color: Colors.white,
                ),
                onPressed: () {
                  _showNovaAtividadeOverlay();
                },
                tooltip: 'Nova atividade',
              ),
            ),
            
            // Botão direito: pictogramas
            IconButton(
              icon: const Icon(
                Icons.image,
                size: 32,
              ),
              onPressed: () {
                // Placeholder: navegar para tela de pictogramas
                Navigator.pushNamed(context, '/pictogramas');
              },
              tooltip: 'Pictogramas',
            ),
          ],
        ),
      ),
    );
  }

  void _showNovaAtividadeOverlay() {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: OverlayNovaAtividade(
            onSalvar: (novaAtividade) {
              setState(() {
                _atividades.add(novaAtividade);
              });
              Navigator.pop(dialogContext);
            },
          ),
        ),
      );
    },
  );
}
}