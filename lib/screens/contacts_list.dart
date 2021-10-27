import 'package:bytebank/components/cardContact.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: findAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Contact> contacts = snapshot.data!;

            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                if (snapshot.hasData) {
                  debugPrint('tem data');
                  return CardContact(contacts[index]);
                } else {
                  return Column(
                    children: [Text('nao tem dados')],
                  );
                }
              },
            );
          }
          return Scaffold();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          ).then((value) => debugPrint(value.toString()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
