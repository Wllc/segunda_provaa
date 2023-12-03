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
        title: const Text('TELA SOBRE'),
      ),
      body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Desenvolvedores',
                style: TextStyle(
                  fontSize: 30
                ),),
              SizedBox(height: 20,),
              Text('Nathan & Wallace',
                style: TextStyle(
                  fontSize: 20
                ),),
              SizedBox(height: 40,)
            ],
              ),
          ), 
    );
  }
}