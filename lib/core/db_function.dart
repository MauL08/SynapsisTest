import 'package:sqflite/sqflite.dart' as sql;
import 'package:synapsis_test/core/db_helper.dart';

class DBFunction {
  static Future postData(String title, String date) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'date': date,
    };
    final id = await db.insert(
      'data',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return id;
  }

  static Future getAllData() async {
    final db = await SQLHelper.db();
    return db.query(
      'data',
      orderBy: 'id',
    );
  }

  static Future getDataById(int id) async {
    final db = await SQLHelper.db();
    return db.query(
      'data',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
  }

  static Future updateData(int id, String title, String date) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'date': date,
      'createdAt': DateTime.now().toString()
    };

    final result = await db.update(
      'data',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );

    return result;
  }

  static Future deleteData(int id) async {
    final db = await SQLHelper.db();

    try {
      await db.delete('data', where: 'id = ?', whereArgs: [id]);
    } catch (e) {}
  }
}
