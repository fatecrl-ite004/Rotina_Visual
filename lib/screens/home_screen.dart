import 'package:flutter/material.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/overlay_nova_atividade.dart';
import '../widgets/item_atividade.dart';
import '../models/atividade.dart';
import '../models/rotina.dart';  // NOVO

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // NOVO: Armazenamento interno (mapa de rotinas)
  Map<String, List<Atividade>> _todasAtividades = {};
  List<Rotina> _rotinas = [];
  String _rotinaAtualId = '';
  
  // A lista _atividades agora é um GETTER que retorna as atividades da rotina atual
  List<Atividade> get _atividades => _todasAtividades[_rotinaAtualId] ?? [];

  // Controle do modo de visualização
  bool _modoApenasVisualizacao = false;

  // Controle do menu lateral
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _carregarDadosIniciais();
  }

  void _carregarDadosIniciais() {
    // Criar rotina padrão
    final rotinaPadrao = Rotina(id: '1', nome: 'Minha Rotina');
    _rotinas = [rotinaPadrao];
    _rotinaAtualId = '1';
    _todasAtividades['1'] = [];
  }

  // NOVO: Criar nova rotina
  // NOVO: Criar nova rotina (recebe String, mas o MenuLateral espera VoidCallback)
void _criarNovaRotina() {
  // Gera um nome padrão
  final novoNome = 'Nova Rotina ${_rotinas.length + 1}';
  final novaId = DateTime.now().millisecondsSinceEpoch.toString();
  final novaRotina = Rotina(id: novaId, nome: novoNome);
  
  setState(() {
    _rotinas.add(novaRotina);
    _todasAtividades[novaId] = [];
  });
}

// NOVO: Excluir rotina (recebe Rotina, não String)
void _excluirRotina(Rotina rotina) {
  if (_rotinas.length <= 1) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Você precisa ter pelo menos uma rotina!')),
    );
    return;
  }
  
  setState(() {
    _rotinas.removeWhere((r) => r.id == rotina.id);
    _todasAtividades.remove(rotina.id);
    
    if (_rotinaAtualId == rotina.id) {
      _rotinaAtualId = _rotinas.first.id;
    }
  });
}

// NOVO: Selecionar rotina (recebe Rotina, não String)
void _selecionarRotina(Rotina rotina) {
  setState(() {
    _rotinaAtualId = rotina.id;
  });
  Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    // Obter nome da rotina atual
    final rotinaAtual = _rotinas.firstWhere(
      (r) => r.id == _rotinaAtualId,
      orElse: () => _rotinas.first,
    );
    
    return Scaffold(
      key: _scaffoldKey,
      
      // Drawer (menu lateral) - ATUALIZADO
      drawer: MenuLateral(
        rotinas: _rotinas,
        rotinaAtualId: _rotinaAtualId,
        onSelecionarRotina: _selecionarRotina,
        onCriarNovaRotina: _criarNovaRotina,
        onExcluirRotina: _excluirRotina,
      ),
      
      // AppBar - ATUALIZADO (mostra nome da rotina)
      appBar: AppBar(
        title: Text(
          rotinaAtual.nome,
          style: const TextStyle(fontWeight: FontWeight.bold),
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
              Navigator.pushNamed(context, '/configuracoes');
            },
            tooltip: 'Configurações',
          ),
        ],
      ),
      
      // Corpo da página (lista de atividades) - QUASE IGUAL
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
                  const SizedBox(height: 8),
                  Text(
                    'na rotina "${rotinaAtual.nome}"',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
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
      onEdit: (atividadeAntiga, atividadeEditada) {
        setState(() {
          final idx = _atividades.indexWhere((a) => a.id == atividadeAntiga.id);
          if (idx != -1) {
            _todasAtividades[_rotinaAtualId]![idx] = atividadeEditada;
          }
        });
        // ← NÃO precisa retornar nada, só executa
      },
      onDelete: (atividade) {
        setState(() {
          _todasAtividades[_rotinaAtualId]!.remove(atividade);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Atividade excluída')),
        );
      },
    );
  },
),
      
      // BottomNavigationBar (footer) - QUASE IGUAL
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Theme.of(context).appBarTheme.backgroundColor,
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
                color: Theme.of(context).primaryColor, // COR DO TEMA
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
                color: Color.fromRGBO(117, 117, 117, 1),
              ),
              onPressed: () {
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
                  // Adiciona a rotinaId aqui!
                  final atividadeCompleta = Atividade(
                    id: novaAtividade.id,
                    nome: novaAtividade.nome,
                    horarioInicio: novaAtividade.horarioInicio,
                    horarioTermino: novaAtividade.horarioTermino,
                    pictogramaPath: novaAtividade.pictogramaPath,
                    isMudanca: novaAtividade.isMudanca,
                    rotinaId: _rotinaAtualId,  // ← VINCULA À ROTINA ATUAL
                  );
                  _todasAtividades[_rotinaAtualId]!.add(atividadeCompleta);
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