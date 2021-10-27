import 'package:bytebank/components/cardContact.dart';
import 'package:bytebank/dao/contacts_dao.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactsDAO contactsDAO = ContactsDAO();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: contactsDAO.findAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Contact> contacts = snapshot.data!;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: [CircularProgressIndicator()],
                  ),
                );

              case ConnectionState.done:
                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      return CardContact(contacts[index]);
                    } else {
                      return Column(
                        children: [Text('nao tem dados')],
                      );
                    }
                  },
                );

              case ConnectionState.active:
                break;
              case ConnectionState.none:
                break;
            }
          }
          return Scaffold();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then((value) => setState(() {}));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
