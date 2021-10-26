import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'account_number TEXT'
          ')');
    }, version: 1);
  });
}

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

  final List<Map<String, dynamic>> maps = await db.query('contacts');

  return List.generate(
    maps.length,
    (index) {
      return Contact(
        id: maps[index]['id'],
        name: maps[index]['name'],
        accountNumber: maps[index]['accountNumber'],
      );
    },
  );
}
