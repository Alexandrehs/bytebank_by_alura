import 'package:bytebank/dao/contacts_dao.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = new TextEditingController();

  final TextEditingController _accountController = new TextEditingController();

  final ContactsDAO contactsDAO = ContactsDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome Completo'),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountController,
                decoration: InputDecoration(labelText: 'Número da Conta'),
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Criar'),
                  onPressed: () {
                    final name = _nameController.text;
                    final accountNumber = _accountController.text;
                    if (name.isNotEmpty && accountNumber.isNotEmpty) {
                      final Contact newContact =
                          Contact(name: name, account: accountNumber);
                      contactsDAO.insertContact(newContact).then(
                            (value) => Navigator.pop(context),
                          );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
