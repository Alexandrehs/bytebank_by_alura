import 'package:bytebank/dao/contacts_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'contacts_database.db'),
    onCreate: (db, version) {
      return db.execute(
        ContactsDAO.tableSQL,
      );
    },
    version: 1,
  );

  return database;
}
