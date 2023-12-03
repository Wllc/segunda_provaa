import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/disciplina.dart';
import 'package:segunda_prova/helpers/disciplina_helper.dart';
import 'package:segunda_prova/widgets/custom_form_field.dart';


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
        title: const Text('Editar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomFormField(
                  controller: _nomeController,
                  labelText: 'Nome',
                  validate_function: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  controller: _professorController,
                  labelText: 'Professor',
                  validate_function: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  controller: _cargaHorariaController,
                  labelText: 'Carga Horaria',
                  keyboard_type: TextInputType.number,
                  validate_function: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  controller: _salaController,
                  labelText: 'Sala',
                  keyboard_type: TextInputType.number,
                  validate_function: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  controller: _periodoController,
                  labelText: 'Periodo',
                  keyboard_type: TextInputType.number,
                  validate_function: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  controller: _codigoController,
                  labelText: 'Codigo',
                  validate_function: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Atualizar o disciplina no banco de dados
                      await _disciplinaHelper.updateDisciplina(
                        Disciplina(
                          _nomeController.text,
                          _professorController.text,
                          int.parse(_cargaHorariaController.text),
                          int.parse(_salaController.text),
                          int.parse(_periodoController.text),
                          _codigoController.text,
                        ),
                      );

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Alteração realizada com sucesso!'),
                        ),
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text('Confirmar', 
                  style: Theme.of(context).textTheme.labelLarge,)
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}