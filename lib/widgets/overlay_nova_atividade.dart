import 'package:flutter/material.dart';
import '../models/atividade.dart';

class OverlayNovaAtividade extends StatefulWidget {
  final Function(Atividade) onSalvar;

  const OverlayNovaAtividade({super.key, required this.onSalvar});

  @override
  State<OverlayNovaAtividade> createState() => _OverlayNovaAtividadeState();
}

class _OverlayNovaAtividadeState extends State<OverlayNovaAtividade> {
  final _nomeController = TextEditingController();
  String _horaInicio = "08:00";
  String _horaTermino = "09:00";
  bool _isMudanca = false;

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  Future<void> _selecionarHorario(bool isInicio) async {
    // Parse da hora atual
    List<String> partes = (isInicio ? _horaInicio : _horaTermino).split(':');
    TimeOfDay horaAtual = TimeOfDay(
      hour: int.parse(partes[0]),
      minute: int.parse(partes[1]),
    );

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: horaAtual,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: const TimePickerThemeData(
              backgroundColor: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        String horaFormatada = "${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}";
        if (isInicio) {
          _horaInicio = horaFormatada;
        } else {
          _horaTermino = horaFormatada;
        }
      });
    }
  }

  void _salvar() {
  if (_nomeController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Por favor, digite o nome da atividade')),
    );
    return;
  }

  final atividade = Atividade(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    nome: _nomeController.text.trim(),
    horarioInicio: _horaInicio,
    horarioTermino: _horaTermino,
    isMudanca: _isMudanca,
    // ⬅️ NÃO coloque rotinaId aqui!
  );
  
  widget.onSalvar(atividade);
}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Título
          const Text(
            'Nova Atividade',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          
          // Campo Nome
          TextField(
            controller: _nomeController,
            decoration: const InputDecoration(
              labelText: 'Nome da atividade',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.title),
            ),
            autofocus: true,
          ),
          const SizedBox(height: 16),
          
          // Horário de início e término
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => _selecionarHorario(true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.play_arrow, size: 20),
                        const SizedBox(width: 8),
                        Text(_horaInicio),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: InkWell(
                  onTap: () => _selecionarHorario(false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.stop, size: 20),
                        const SizedBox(width: 8),
                        Text(_horaTermino),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Checkbox "É mudança na rotina"
          Row(
            children: [
              Checkbox(
                value: _isMudanca,
                onChanged: (value) {
                  setState(() {
                    _isMudanca = value ?? false;
                  });
                },
                activeColor: Colors.orange,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Marcar como mudança na rotina'),
                    Text(
                      'Esta atividade não se repetirá nos próximos dias',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Botões
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Cancelar'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _salvar,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}