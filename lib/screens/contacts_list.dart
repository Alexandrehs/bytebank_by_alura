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
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Alexandre',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: Text(
              '1000',
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
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
