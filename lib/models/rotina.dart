import 'atividade.dart';

class Rotina {
  String id;
  String nome;
  List<Atividade> atividades;
  bool isAtiva; // se é a rotina sendo exibida no momento

  Rotina({
    required this.id,
    required this.nome,
    this.atividades = const [],
    this.isAtiva = false,
  });

  // Criar uma cópia com alterações
  Rotina copyWith({
    String? id,
    String? nome,
    List<Atividade>? atividades,
    bool? isAtiva,
  }) {
    return Rotina(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      atividades: atividades ?? this.atividades,
      isAtiva: isAtiva ?? this.isAtiva,
    );
  }
}