import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/disciplina.dart';
import 'package:segunda_prova/helpers/disciplina_helper.dart';

class TelaDetalhes extends StatelessWidget {
  final int id;

  const TelaDetalhes({super.key, required this.id}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: FutureBuilder<Disciplina?>(
        future: DisciplinaHelper().getDisciplina(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Nenhum dado encontrado'));
          } else {
            Disciplina disciplina = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${disciplina.id}',),
                  Text('Nome: ${disciplina.nome}'),
                  Text('Professor: ${disciplina.professor}'),
                  Text('Carga Horraria: ${disciplina.cargaHoraria}'),
                  Text('Sala: ${disciplina.sala}'),
                  Text('Periodo: ${disciplina.periodo}'),
                  Text('Codigo: ${disciplina.codigo}'),
                  
                ],
              ),
            );
          }
        },
      ),
    );
  }
}