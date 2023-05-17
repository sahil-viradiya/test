import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<String> getDbPath(String name) async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, name);

  return path;
}

Future<Database> openDB(String path) async {
  Database database = await openDatabase(
    path, version: 1,
    // onCreate: (Database db, int version) async {
    //   // When creating the db, create the table
    //   await db.execute(
    //       'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    // }
  );
  return database;
}

Future<void> createTable(Database database, String query) async {
  await database.execute(query);
}