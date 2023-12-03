import 'package:segunda_prova/domain/disciplina.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DisciplinaHelper {
  //singleton
  //construtor interno
  static final DisciplinaHelper _instance = DisciplinaHelper.internal();

  //criação do factory para retornar a instância
  factory DisciplinaHelper() => _instance;

  //DisciplinaHelper.instance
  DisciplinaHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db == null) _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String? databasesPath = await getDatabasesPath();
    if (databasesPath == null) databasesPath = "";
    String path = join(databasesPath, "disciplinas.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE ${Disciplina.disciplinaTable}(${Disciplina.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "                                 ${Disciplina.nomeColumn} TEXT, "
                  "                                 ${Disciplina.professorColumn} TEXT, "
                  "                                 ${Disciplina.cargaHorariaColumn} INTEGER, "
                  "                                 ${Disciplina.salaColumn} INTEGER,) "
                  "                                 ${Disciplina.periodoColumn} INTEGER,) "
                  "                                 ${Disciplina.codigoColumn} TEXT) "
                  );
        });
  }

  Future<Disciplina> saveDisciplina(Disciplina d) async {
    Database? dbDisciplina = await db;
    if (dbDisciplina != null) {
      d.id = await dbDisciplina.insert(Disciplina.disciplinaTable, d.toMap());
    }
    return d;
  }

  Future<Disciplina?> getDisciplina(int id) async {
    Database? dbDisciplina = await db;
    if (dbDisciplina != null) {
      List<Map> maps = await dbDisciplina.query(Disciplina.disciplinaTable,
          columns: [
            Disciplina.idColumn,
            Disciplina.nomeColumn,
            Disciplina.professorColumn,
            Disciplina.cargaHorariaColumn,
            Disciplina.salaColumn,
            Disciplina.periodoColumn,
            Disciplina.codigoColumn,
          ],
          where: "${Disciplina.idColumn} = ?",
          whereArgs: [id]);
      if (maps.isNotEmpty) {
        return Disciplina.fromMap(maps.first);
      } else {
        return null;
      }
    }
    return null;
  }

  Future<int> deleteDisciplina(int id) async {
    Database? dbDisciplina = await db;
    if (dbDisciplina!= null) {
      return await dbDisciplina.delete(Disciplina.disciplinaTable,
          where: "${Disciplina.idColumn} = ?", whereArgs: [id]);
    } else {
      return 0;
    }
  }

  Future<int> updateDisciplina(Disciplina d) async {
    Database? dbDisciplina = await db;
    if (dbDisciplina != null) {
      return await dbDisciplina.update(Disciplina.disciplinaTable, d.toMap(),
          where: "${Disciplina.idColumn} = ?", whereArgs: [d.id]);
    } else {
      return 0;
    }
  }

  Future<List> getAll() async {
    Database? dbDisciplina = await db;
    if (dbDisciplina != null) {
      List listMap = await dbDisciplina.query(Disciplina.disciplinaTable);
      List<Disciplina> listDisciplinas = [];

      for (Map m in listMap) {
        listDisciplinas.add(Disciplina.fromMap(m));
      }
      return listDisciplinas;
    } else {
      return [];
    }
  }
}