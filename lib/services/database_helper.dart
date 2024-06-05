import 'package:notes_app_sql/models/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Notes.db";

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE NOTES (id INTEGER PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL, color TEXT NOT NULL, dateTime TEXT NOT NULL, isFavourite INTEGER NOT NULL)'),
      version: _version,
    );
  }

  static Future<int> addNote(Note note) async {
    final db = await _getDB();
    return await db.insert("NOTES", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateNote(Note note) async {
    final db = await _getDB();
    return await db.update("NOTES", note.toJson(),
        where: "id = ?",
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteNote(Note note) async {
    final db = await _getDB();
    return await db.delete("NOTES", where: "id = ?", whereArgs: [note.id]);
  }

  static Future<List<Note>?> getNotes() async {
    final db = await _getDB();
    List<Map<String, dynamic>> maps = await db.query("NOTES");
    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }
}
