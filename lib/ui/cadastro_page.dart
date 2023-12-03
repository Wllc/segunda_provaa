import 'package:flutter/material.dart';
import 'package:segunda_prova/helpers/disciplina_helper.dart';
import 'package:segunda_prova/widgets/custom_form_field.dart';

import '../domain/disciplina.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cadastrar"),
      ),
      body: const FormDisciplinaBody(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class FormDisciplinaBody extends StatefulWidget {
  const FormDisciplinaBody({
    super.key,
  });

  @override
  State<FormDisciplinaBody> createState() => _FormDisciplinaBodyState();
}

class _FormDisciplinaBodyState extends State<FormDisciplinaBody> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nomeController = TextEditingController();
  TextEditingController professorController = TextEditingController();
  TextEditingController cargaHorariaController = TextEditingController();
  TextEditingController salaController = TextEditingController();
  TextEditingController periodoController = TextEditingController();
  TextEditingController codigoController = TextEditingController();

  final disciplinaHelper = DisciplinaHelper();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomFormField(
              controller: nomeController,
              labelText: "Nome",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: professorController,
              labelText: "Professor",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: cargaHorariaController,
              labelText: "Carga Horária",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: salaController,
              labelText: "Número da sala",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },          
            ),
            CustomFormField(
              controller: periodoController,
              labelText: "Periodo",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: codigoController,
              labelText: "Código",
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
                  Disciplina d = Disciplina(
                    nomeController.text,        
                    professorController.text,   
                    int.parse(cargaHorariaController.text),
                    int.parse(salaController.text),        
                    int.parse(periodoController.text),     
                    codigoController.text,
                    );
                  disciplinaHelper.saveDisciplina(d);
                  Navigator.pop(context);
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                "Cadastrar",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}