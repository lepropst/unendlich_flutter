import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Db {
  Future<dynamic> getAllNoteBooks() {
    var uri = constructUri("notebooks/");
    const username = "elir";
    const password = "t";
    final String authHeader =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    var response = http.get(Uri.parse(uri),
        headers: <String, String>{'authorization': authHeader});

    return response;
  }

  String constructUri(String str) {
    return "http://108.160.183.27:8000/${str}";
  }

  // Future<Database> get database async {
  //   if (_database != null) return _database as Database;
  //   _database = await _initDatabase();
  //   return _database as Database;
  // }

  // _initDatabase() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentsDirectory.path, _databaseName);
  //   return await openDatabase(path,
  //       version: _databaseVersion, onCreate: _onCreate);
  // }

  // Future _onCreate(Database db, int version) async {
  //   await db.execute('''
  //         CREATE TABLE IF NOT EXISTS $noteTable (
  //           $columnId TEXT PRIMARY KEY,
  //           $columnLabel TEXT NOT NULL DEFAULT "",
  //           $columnContent TEXT NOT NULL DEFAULT "",
  //           $columnEdited TEXT NOT NULL DEFAULT ""
  //         )
  //         ''');
  // }

  // Db._privateConstructor();
  // static final Db instance = Db._privateConstructor();

  // Future<int> insert(Map<String, dynamic> row, String table) async {
  //   print("inserting ${row['label']}");
  //   Database db = await instance.database;
  //   return await db.insert(table, row);
  // }

  // Future<String> delete(String id, String table) async {
  //   Database db = await instance.database;
  //   await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  //   return id;
  // }

  // // All of the rows are returned as a list of maps, where each map is
  // // a key-value list of columns.
  // Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
  //   Database db = await instance.database;
  //   return await db.query(table);
  // }

  // Future<int> countRows(String table) async {
  //   Database db = await instance.database;
  //   int i = (await db.rawQuery('''SELECT _id FROM ${table}''')).length;
  //   return i;
  // }

  // // We are assuming here that the id column in the map is set. The other
  // // column values will be used to update the row.
  // Future<int> updateByMap(Map<String, dynamic> row, String table) async {
  //   print("updating ${row}");
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<List<Map<String, Object?>>> query(String condition,
  //     List conditionArguments, List<String> columns, String table) async {
  //   final Database db = await instance.database;
  //   return await db.query(table,
  //       columns: columns, where: condition, whereArgs: conditionArguments);
  // }
}
