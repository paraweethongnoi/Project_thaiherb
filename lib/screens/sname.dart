import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class Sname extends StatefulWidget {
  @override
  _SnameState createState() => _SnameState();
}

class _SnameState extends State<Sname> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    getAllContacts();
  }

  getAllContacts() async {
    List<Contact> _contact =
        (await ContactsService.getContacts(withThumbnails: false)).toList();
    setState(() {
      contacts = _contact;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Search by name'),
            backgroundColor: Colors.lightBlueAccent),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                'Paaaaaaa',
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  Contact contact = contacts[index];
                  return ListTile(
                    title: Text(contact.displayName),
                    subtitle: Text(contact.phones.elementAt(0).value),
                  );
                },
              )
            ],
          ),
        ));
  }
}
