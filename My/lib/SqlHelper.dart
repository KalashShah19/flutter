import 'package:sqflite/sqflite.dart' as sql;

class Sqlhelper{

  static Future<void> createTable(sql.Database database) async{
    await database.execute("CREATE TABLE stud(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "name TEXT, email TEXT, createdAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP)");
  }

  static Future<sql.Database> open() async{
    return sql.openDatabase('sms.db',
    version: 1,
    onCreate: (sql.Database database, int version) async{
      await createTable(database);
    });
  }

  static Future<int> AddStudent(String name, String? email) async
  {
    final db = await Sqlhelper.open();
    final data = {'name':name, 'email':email};
    final id = db.insert('stud', data);
    return id;
  }

  static Future<List<Map<String,dynamic>>> GetStudentList() async{
    final db = await Sqlhelper.open();
    return db.query('stud',orderBy: 'id');
  }

  static Future<int> UpdateStudent(int id, String name, String? email) async{
    final db = await Sqlhelper.open();
    final data = {"name":name,"email":email};
    final result = db.update('stud', data, where: " id =? ",
    whereArgs: [id]);
    return result;
  }

  static Future<void> DeleteStudent(int id) async{
    final db = await Sqlhelper.open();
    await db.delete('stud',where: " id = ?",
    whereArgs: [id]);
  }
}