import 'package:flutter/material.dart';
import 'package:segunda_prova/ui/cadastro_page.dart';
import 'package:segunda_prova/ui/list_page.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Disciplinas"),
      ),
      body: const HomeBody(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}


class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(7),
            child: TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CadastroPage(),
                ),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  minimumSize: const Size(150, 50)),
              child: const Text("Cadastrar Disciplina"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListPage(),
                ),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  minimumSize: const Size(150, 50)),
              child: const Text("Lista de Disciplinas"),
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            mini: true,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CadastroPage(),
                ),
              );
            },
            child: const Icon(Icons.add), 
          ),       
        ],
      ),
    );
  }
}


