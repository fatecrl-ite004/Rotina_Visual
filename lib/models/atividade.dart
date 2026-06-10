class Atividade {
  String id;
  String nome;
  String horarioInicio;
  String horarioTermino;
  String? pictogramaPath;
  bool isMudanca;
  String? rotinaId; 

  Atividade({
    required this.id,
    required this.nome,
    required this.horarioInicio,
    required this.horarioTermino,
    this.pictogramaPath,
    this.isMudanca = false,
    this.rotinaId,  // NÃO É REQUIRED
  });
}