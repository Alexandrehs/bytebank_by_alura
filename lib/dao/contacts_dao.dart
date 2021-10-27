import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sql.dart';

class ContactsDAO {
  static const String tableSQL =
      'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, $_name TEXT, $_account TEXT)';
  static const String _tableName = 'contacts';
  static const String _name = 'name';
  static const String _account = 'account';

  Future<int> insertContact(Contact contact) async {
    final db = await createDatabase();

    return await db.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Contact>> findAll() async {
    final db = await createDatabase();

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(
      maps.length,
      (index) {
        return Contact(
          name: maps[index][_name],
          account: maps[index][_account],
        );
      },
    );
  }
}
