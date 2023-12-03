import 'package:flutter/material.dart';

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
                padding: const EdgeInsets.all(7),
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
        },
        onLongPress: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Long Press"),
          ));
        },
        child: ListTile(
        title: Text(disciplina.nome),
    ),
      );
  }
}