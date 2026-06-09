import 'package:flutter/material.dart';

// gerencia as configuracoes, como tema e cor de destaque, e muda em todos os lugares
class ConfiguracoesProvider extends ChangeNotifier {
  bool _temaEscuro = false;

  Color _corPrincipal =const Color.fromRGBO(125, 188, 239, 1);

  bool get temaEscuro => _temaEscuro;

  Color get corPrincipal => _corPrincipal;

  void alternarTema() {
    _temaEscuro = !_temaEscuro;
    notifyListeners();
  }

  void alterarCorPrincipal(Color cor) {
    _corPrincipal = cor;
    notifyListeners();
  }
}