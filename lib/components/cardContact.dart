import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class CardContact extends StatelessWidget {
  final Contact contact;
  CardContact(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.account,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
