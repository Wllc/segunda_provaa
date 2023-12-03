import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/disciplina.dart';
import 'package:segunda_prova/helpers/disciplina_helper.dart';


class TelaAltera extends StatefulWidget {
  final int id;

  const TelaAltera({Key? key, required this.id}) : super(key: key);

  @override
  _TelaAlteraState createState() => _TelaAlteraState();
}

class _TelaAlteraState extends State<TelaAltera> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _professorController = TextEditingController();
  final TextEditingController _cargaHorariaController = TextEditingController();
  final TextEditingController _salaController = TextEditingController();
  final TextEditingController _periodoController = TextEditingController();
  final TextEditingController _codigoController = TextEditingController();


  final DisciplinaHelper _disciplinaHelper = DisciplinaHelper();

  Future<Disciplina?> _loadData(int id) async {
    Disciplina? disciplina = await _disciplinaHelper.getDisciplina(id);
    return disciplina;
  }

  @override
  void initState() {
    super.initState();
    _loadData(widget.id).then((disciplina) {
      if (disciplina != null) {
        _nomeController.text = disciplina.nome;
        _professorController.text = disciplina.professor;
        _cargaHorariaController.text = disciplina.cargaHoraria.toString();
        _salaController.text = disciplina.sala.toString();
        _periodoController.text = disciplina.periodo.toString();
        _codigoController.text = disciplina.codigo.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar disciplina'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _professorController,
                  decoration: const InputDecoration(labelText: 'Professor'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _cargaHorariaController,
                  decoration: const InputDecoration(labelText: 'Carga Horaria'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _salaController,
                  decoration: const InputDecoration(
                      labelText: 'Sala'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _periodoController,
                  decoration: const InputDecoration(labelText: 'Periodo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _codigoController,
                  decoration:
                      const InputDecoration(labelText: 'Codigo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.datetime,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Atualizar o disciplina no banco de dados
                      await _disciplinaHelper.updateDisciplina(
                        Disciplina(
                          id: widget.id,
                          nome: _nomeController.text,
                          professor: _professorController.text,
                          cargaHoraria: int.parse(_cargaHorariaController.text),
                          sala: int.parse(_salaController.text),
                          periodo: int.parse(_periodoController.text),
                          codigo:_codigoController.text,
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Alteração realizada com sucesso!'),
                        ),
                      );

                      //Navigator.popUntil(context, ModalRoute.withName('/'));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Confirmar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}