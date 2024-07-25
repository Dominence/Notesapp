
import 'package:learn/model/notes_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class NoteRepository{
  static const _dbName="notes_database.db";
  static const _tableName="notes";

  static Future<Database> _database()async{
    final database=openDatabase(
      join(await getDatabasesPath(),_dbName),
      onCreate: (db, version){
        return db.execute(
            'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY,title TEXT,category TEXT, createdAt TEXT)'
        );
      },
      version: 1,
    );
    return database;
  }
  static insert({required NotesModel notesmodel})async{
    final db = await _database();
    await db.insert(
        _tableName,
        notesmodel.toMap(),conflictAlgorithm:ConflictAlgorithm.replace    );
  }
}