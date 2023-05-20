import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE data(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    date TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future db() async {
    return sql.openDatabase("text.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }
}
