import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: TelaSobre(),
    );
  }
}

class TelaSobre extends StatelessWidget {
  const TelaSobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Sobre'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: 
          const Text('Autores: Nathan & Wallace')
              ),
          ),
    );
  }
}