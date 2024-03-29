import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tableVigas = 'vigas';
final String columnId = '_id';
final String columnResultados = 'resultados';
final String columnFecha = 'fecha';
final String columnIndice = 'indice';
final String columnvariables = 'variables';

// data model class
class Viga {
  int id;
  String resultados;
  String fecha;
  int indice;
  String variables;

  Viga();

  // convenience constructor to create a Word object
  Viga.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    resultados = map[columnResultados];
    fecha = map[columnFecha];
    indice = map[columnIndice];
    variables = map[columnvariables];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnResultados: resultados,
      columnFecha: fecha,
      columnIndice: indice,
      columnvariables: variables
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "SavedVigas.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableVigas (
                $columnId INTEGER PRIMARY KEY,
                $columnResultados TEXT NOT NULL,
                $columnFecha TEXT NOT NULL,
                $columnIndice INTEGER NOT NULL,
                $columnvariables TEXT NOT NULL
              )
              ''');
  }

  // Database helper methods:
  Future<int> insert(Viga viga) async {
    Database db = await database;
    int id = await db.insert(tableVigas, viga.toMap());
    return id;
  }

  Future<int> delete(int id) async {
    Database db = await database;
    db.delete(tableVigas, where: '$columnId = ?', whereArgs: [id]);
    return id;
  }

  Future<Viga> queryViga(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableVigas,
        columns: [columnId, columnResultados, columnFecha],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Viga.fromMap(maps.first);
    }
    return null;
  }

  Future<List> queryVigas() async {
    Database db = await database;
    List<Map> result = await db.query(tableVigas);
    return result;
  }
}
