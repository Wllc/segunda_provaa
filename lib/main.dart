import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =  openDatabase(
    join(await getDatabasesPath(), 'disciplinas_database.db'),
    onCreate: (db, version){
      return db.execute(
        'CREATE TABLE disciplinas(id INTEGER PRIMARY KEY, nome TEXT, professor TEXT, cargaHoraria INTEGER, sala INTEGER, periodo INTEGER, codigo TEXT)',
      );
    },
    version: 1,
  );
  runApp(MyApp(database: database,));
}

class MyApp extends StatelessWidget {
  final Future<Database> database;
  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD DISCIPLINAS',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TelaHome(database:database),
    );
  }
}

class TelaHome extends StatefulWidget {
  final Future<Database> database;
  const TelaHome({super.key, required this.database}); 

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _professorController = TextEditingController();
  TextEditingController _cargaHorariaController = TextEditingController();
  TextEditingController _salaController = TextEditingController();
  TextEditingController _periodoController = TextEditingController();
  TextEditingController _codigoController = TextEditingController();
  
  List<Map<String, dynamic>> _disciplinas = [];

  @override
  void initState(){
    super.initState();
    refreshDisciplinaList();
  }

  Future<void> insertDisciplina(String nome, String professor, int cargaHoraria, int sala, int periodo, String codigo) async{
    final Database db = await widget.database;
    await db.insert('disciplinas', {
      'nome': nome,
      'professor': professor,
      'cargaHoraria': cargaHoraria,
      'sala': sala,
      'periodo': periodo,
      'codigo':codigo
    },
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateDisciplina(int id, String nome, String professor, int cargaHoraria, int sala, int periodo, String codigo) async{
    final Database db = await widget.database;
    await db.update('disciplinas', {
      'nome': nome,
      'professor': professor,
      'cargaHoraria': cargaHoraria,
      'sala': sala,
      'periodo': periodo,
      'codigo':codigo,
      },
      where: 'id = ?',
      whereArgs: [id],
      );
  }

  Future<void> deleteDisciplina(int id) async{
    final Database db = await widget.database;
    await db.delete(
      'disciplinas', 
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> refreshDisciplinaList() async{
    final Database db = await widget.database;
    final List<Map<String, dynamic>> maps = await db.query('disciplinas');
    setState(() {
      _disciplinas = maps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD DISCIPLINAS"),),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            controller: _nomeController,
            decoration: InputDecoration(
              hintText: "Nome da disciplina",
              border: OutlineInputBorder(),
            )
          )),
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            controller: _professorController,
            decoration: InputDecoration(
              hintText: "Professor",
              border: OutlineInputBorder(),
            )
          )),
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            controller: _cargaHorariaController,
            decoration: InputDecoration(
              hintText: "Carga horaria",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          )),
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            controller: _salaController,
            decoration: InputDecoration(
              hintText: "Número da sala",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number
          )),
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            controller: _periodoController,
            decoration: InputDecoration(
              hintText: "Periodo",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number
          )),
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            controller: _codigoController,
            decoration: InputDecoration(
              hintText: "Codigo",
              border: OutlineInputBorder(),
            )
          )),
          ElevatedButton(onPressed: ()async{
            await insertDisciplina(_nomeController.text, _professorController.text, int.parse(_cargaHorariaController.text), int.parse(_salaController.text), int.parse(_periodoController.text), _codigoController.text);
            refreshDisciplinaList();
          }, child: Text("Adicionar Disciplinas"),
          ),
          Expanded(child: ListView.builder(
            itemCount: _disciplinas.length,
            itemBuilder: (context, index){
              final disciplina = _disciplinas[index];
              return ListTile(
                title: Text(disciplina['nome']),
                subtitle: Text(disciplina['professor']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: Text("Editar disciplina"),
                        content: Column( 
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                                controller: TextEditingController(text: disciplina['nome']),
                                decoration: InputDecoration(
                                  hintText: "Nome da disciplina",
                                  border: OutlineInputBorder(),
                                )
                              ),
                            TextField(
                                controller: TextEditingController(text: disciplina['professor']),
                                decoration: InputDecoration(
                                  hintText: "Professor",
                                  border: OutlineInputBorder(),
                                )
                              ),
                              TextField(
                                controller: TextEditingController(text: disciplina['cargaHoraria']),
                                decoration: InputDecoration(
                                  hintText: "Carga horaria",
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              TextField(
                                controller: TextEditingController(text: disciplina['sala']),
                                decoration: InputDecoration(
                                  hintText: "Número da sala",
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number
                              ),
                              TextField(
                                controller: TextEditingController(text: disciplina['periodo']),
                                decoration: InputDecoration(
                                  hintText: "Periodo",
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number
                            ),
                            TextField(
                              controller: TextEditingController(text: disciplina['codigo']),
                              decoration: InputDecoration(
                                hintText: "Codigo",
                                border: OutlineInputBorder(),
                              )
                            )
                          ],
                          ),

                          actions: [
                            TextButton(onPressed: () async{
                              await updateDisciplina(disciplina['id'], _nomeController.text, _professorController.text, int.parse(_cargaHorariaController.text), int.parse(_salaController.text), int.parse(_periodoController.text), _codigoController.text);
                              Navigator.pop(context);
                              refreshDisciplinaList();
                            }, child: Text("Atualizar"))
                          ],
                      ));
                    }, icon: Icon(Icons.edit)),
                    TextButton(onPressed: () async{
                      await deleteDisciplina(disciplina['id']);
                    }, child: Icon(Icons.delete))
                  ],
                ),
              );
            },),)
        ]),
    );
  }
}

