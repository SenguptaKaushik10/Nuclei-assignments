import 'package:assignment_contacts_app/models/contacts.dart';
import 'package:assignment_contacts_app/views/contact_info_page.dart';
import 'package:assignment_contacts_app/views/update_contact_page.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:assignment_contacts_app/views/home_page.dart';
import 'package:assignment_contacts_app/controllers/contact_list_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class Search extends SearchDelegate {
  ContactListController contactsController = Get.put(ContactListController());
  final contactsBox = Hive.box<Contacts>('contacts');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = contactsController.contactsList
        .where((p) => p.displayName!.startsWith(query))
        .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          Contact contact = suggestionList.elementAt(index);
          return ListTile(
            onTap: () async{
              contact = await Get.to(() => ContactInfoPage(), arguments: contact);
            },
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey[400],
              radius: 25.0,
              child: Text(
                '${contact.givenName![0]}${contact.familyName![0]}',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.blueGrey[900],
                ),
              ),
            ),
            title: Text(
              '${contact.givenName!} ${contact.familyName!}',
              style: TextStyle(fontSize: 26, color: Colors.blueGrey[900]),
            ),
            subtitle: Text(
              contact.phones?.elementAt(0).value ?? '',
              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey[900]),
            ),
          );
        });
  }
}
