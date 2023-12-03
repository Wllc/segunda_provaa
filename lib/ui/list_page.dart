import 'package:flutter/material.dart';
import 'package:segunda_prova/ui/tela_altera_page.dart';
import 'package:segunda_prova/ui/tela_detalhe_page.dart';

import '../domain/disciplina.dart';
import '../helpers/disciplina_helper.dart';


class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Disciplinas"),
      ),
      body: const ListBody(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}


class ListBody extends StatefulWidget {
  const ListBody({super.key});

  @override
  State<ListBody> createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBody> {
  final disciplinaHelper = DisciplinaHelper();
  late Future<List> disciplinas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disciplinas = disciplinaHelper.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: disciplinas,
      builder: (context, snapshot) {
        return snapshot.hasData  ? ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return ListItem(disciplina: snapshot.data![i]);
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final Disciplina disciplina;
  const ListItem({super.key, required this.disciplina});

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Single Tap"),
          ));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaDetalhes(id: disciplina.id)),
          );
        },
        onLongPress: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Long Press"),
          ));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaAltera(id: disciplina.id)),
          );
        },
        child: ListTile(
        title: Text(disciplina.nome),
        subtitle: Text(disciplina.professor),
    ),
      );
  }
}