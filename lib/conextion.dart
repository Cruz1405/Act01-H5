import 'package:database/DBHelper.dart';

class Conection {
  DBHelper dbHelper = DBHelper();

  Future<int> save(String name) async {
    var dbClient = await dbHelper.db;
    var result =
        await dbClient.rawInsert('INSERT INTO Test(name) VALUES(?)', [name]);
    return result;
  }

  Future<List> getAll() async {
    var dbClient = await dbHelper.db;
    var result = await dbClient.query('Test', columns: ['id', 'name']);
    return result.toList();
  }

  Future<int> update(int id, String name) async {
    var dbClient = await dbHelper.db;
    var result = await dbClient.update('Test', {'name': name},
        where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    var result =
        await dbClient.delete('Test', where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
