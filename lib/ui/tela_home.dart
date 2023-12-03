import 'package:flutter/material.dart';
import 'package:segunda_prova/ui/cadastro_page.dart';
import 'package:segunda_prova/ui/list_page.dart';
import 'package:segunda_prova/ui/tela_sobre_page.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Disciplinas"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Ajuste a margem conforme necessário
            child: IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaSobre()),
                );
              },
            ),
          )
        ],
        
      ),
      body: const HomeBody(),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CadastroPage(),
                ),
              );
            },
            backgroundColor: Color.fromARGB(255, 235, 87, 255),
            child: const Icon(Icons.add), 
          ),
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
                  minimumSize: const Size(200, 50)),
              child: const Text("CADASTRAR"),
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
                  minimumSize: const Size(200, 50)),
              child: const Text("LISTAR"),
            ),
          ),
          const SizedBox(height: 10),
                 
        ],
      ),
    );
  }
}


