import 'package:app/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/type.dart';

class ListPage extends StatefulWidget implements HasLayoutGroup {
  const ListPage(
      {Key? key, required this.layoutGroup, required this.onLayoutToggle})
      : super(key: key);

  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Widget _buildContent() {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, index) {
          Contact contact = list[index];
          return ContactListTitle(contact: contact);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: widget.layoutGroup,
        onLayoutToggle: widget.onLayoutToggle,
        layoutType: LayoutType.list,
      ),
      body: Container(
        child: _buildContent(),
      ),
    );
  }
}

class ContactListTitle extends ListTile {
  ContactListTitle({Key? key, required Contact contact})
      : super(
            key: key,
            title: Text(contact.name),
            subtitle: Text(contact.email),
            leading: CircleAvatar(
              child: Text(contact.name[0]),
            ));
}

class Contact {
  final String name;
  final String email;

  Contact({required this.name, required this.email});
}

List<Contact> list = [
  Contact(name: 'Aaryan', email: 'dsa@das.com'),
  Contact(name: 'Isa Tusa', email: 'isa.tusa@me.com'),
  Contact(name: 'Racquel Ricciardi', email: 'racquel.ricciardi@me.com'),
  Contact(name: 'Teresita Mccubbin', email: 'teresita.mccubbin@me.com'),
  Contact(name: 'Rhoda Hassinger', email: 'rhoda.hassinger@me.com'),
  Contact(name: 'Carson Cupps', email: 'carson.cupps@me.com'),
  Contact(name: 'Aaryan', email: 'dsa@das.com'),
  Contact(name: 'Isa Tusa', email: 'isa.tusa@me.com'),
  Contact(name: 'Racquel Ricciardi', email: 'racquel.ricciardi@me.com'),
  Contact(name: 'Teresita Mccubbin', email: 'teresita.mccubbin@me.com'),
  Contact(name: 'Rhoda Hassinger', email: 'rhoda.hassinger@me.com'),
  Contact(name: 'Carson Cupps', email: 'carson.cupps@me.com'),
  Contact(name: 'Aaryan', email: 'dsa@das.com'),
  Contact(name: 'Isa Tusa', email: 'isa.tusa@me.com'),
  Contact(name: 'Racquel Ricciardi', email: 'racquel.ricciardi@me.com'),
  Contact(name: 'Teresita Mccubbin', email: 'teresita.mccubbin@me.com'),
  Contact(name: 'Rhoda Hassinger', email: 'rhoda.hassinger@me.com'),
  Contact(name: 'Carson Cupps', email: 'carson.cupps@me.com'),
  Contact(name: 'Aaryan', email: 'dsa@das.com'),
  Contact(name: 'Isa Tusa', email: 'isa.tusa@me.com'),
  Contact(name: 'Racquel Ricciardi', email: 'racquel.ricciardi@me.com'),
  Contact(name: 'Teresita Mccubbin', email: 'teresita.mccubbin@me.com'),
  Contact(name: 'Rhoda Hassinger', email: 'rhoda.hassinger@me.com'),
  Contact(name: 'Carson Cupps', email: 'carson.cupps@me.com'),
];
