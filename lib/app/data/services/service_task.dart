import 'package:sqflite/sqflite.dart';
import 'package:task_management_app/app/data/model/model_task.dart';

class ServiceTask {
  static const String _databaseName = 'taskDb.db';
  static const String _tableName = 'task';
  static const int _version = 1;

  Future<void> createTables(Database database) async {
    await database.execute(
      '''CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT
      )''',
    );
  }

  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Memperbarui status isSelected untuk task
  Future<int> updateSelection(int id, bool isSelected) async {
    final db = await _initializeDb();
    final result = await db.rawUpdate(
      'UPDATE $_tableName SET isSelected = ? WHERE id = ?',
      [
        isSelected ? 1 : 0,
        id
      ], // Mengonversi boolean ke 1 (true) atau 0 (false)
    );
    return result;
  }

  // Insert item baru menggunakan rawInsert
  Future<int> insertItem(String title, String description) async {
    final db = await _initializeDb();
    try {
      final id = await db.rawInsert(
        'INSERT INTO $_tableName (title, description) VALUES (?, ?)',
        [title, description],
      );
      print('Data inserted with id: $id, $title, $description');
      return id;
    } catch (e) {
      print('Insert failed: $e');
      return -1; // Return error indication if needed
    }
  }

  // Membaca seluruh item menggunakan rawQuery
  Future<List<ModelTask>> getAllItems() async {
    final db = await _initializeDb();
    final results = await db.rawQuery('SELECT * FROM $_tableName');
    return results.map((result) => ModelTask.fromJson(result)).toList();
  }

  // Memperbarui item berdasarkan id menggunakan rawUpdate
  Future<int> updateItem(int id, String title, String description) async {
    final db = await _initializeDb();
    final result = await db.rawUpdate(
      'UPDATE $_tableName SET title = ?, description = ? WHERE id = ?',
      [title, description, id],
    );
    return result;
  }

  // Menghapus item berdasarkan id menggunakan rawDelete
  Future<int> removeItem(int id) async {
    final db = await _initializeDb();
    final result = await db.rawDelete(
      'DELETE FROM $_tableName WHERE id = ?',
      [id],
    );
    return result;
  }
}
