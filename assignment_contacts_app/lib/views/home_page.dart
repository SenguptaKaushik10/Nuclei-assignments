import 'package:assignment_contacts_app/controllers/contact_list_controller.dart';
import 'package:assignment_contacts_app/models/contacts.dart';
import 'package:assignment_contacts_app/views/add_contact_page.dart';
import 'package:assignment_contacts_app/views/contact_info_page.dart';
import 'package:assignment_contacts_app/views/search_page.dart';
import 'package:assignment_contacts_app/views/update_contact_page.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ContactListController contactsController =
      Get.put(ContactListController());

  final contactsBox = Hive.box<Contacts>('contacts');

  final String APPBAR_TITLE_STRING = 'Contacts';
  final String ELEVATED_BUTTON_STRING = 'Add';

  void addContact(Contact contact) {
    contactsBox.put(contact.identifier, Contacts(contactDetails: contact.toMap()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text(APPBAR_TITLE_STRING,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 30.0,
          ),
          ),
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
                icon: Icon(Icons.search),
              color: Colors.blueGrey,
            ),
            ElevatedButton(
              onPressed: () async {
               Contact newContact = await Get.to(() => AddContactPage());
               await ContactsService.addContact(newContact);
               List<Contact> newContactWithIdentifierList = await ContactsService.getContacts(query : newContact.givenName);
               var newContactWithIdentifier;
               newContactWithIdentifierList.forEach((contact) {
                 if(contact.phones?.first.value == newContact.phones?.first.value){
                   newContactWithIdentifier = contact;
                 }
               });
               contactsController.contactsList.add(newContactWithIdentifier);
               contactsController.contactsList.sort((a, b) => a.givenName!.compareTo(b.givenName!));
               addContact(newContactWithIdentifier);
            } ,
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[900]
              ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_call,
                      color: Colors.blueGrey,
                    ),
                    Text(ELEVATED_BUTTON_STRING,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.blueGrey,
                    ),)
                  ],
                ),
            ),
          ],
        ),
        body: Obx((){

          return ListView.builder(
            itemCount: contactsController.contactsList.length,
            itemBuilder: (BuildContext context, int index) {
              Contact contact = contactsController.contactsList.elementAt(index);
              return ListTile(
                onTap: () async{
                  contact = await Get.to(() => ContactInfoPage(), arguments: contact);
                },
                contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey[400],
                  radius: 25.0,
                  child: Text('${contact.givenName![0]}${contact.familyName![0]}',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.blueGrey[900],
                  ),),
                ),
                title: Text('${contact.givenName!} ${contact.familyName!}',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.blueGrey[900]
                ),),
                subtitle: Text(contact.phones?.elementAt(0).value ?? '',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueGrey[900],
                ),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () async {
                          contactsController.contactsList.remove(contact);
                          await ContactsService.deleteContact(contact);
                          contactsBox.delete(contact.identifier);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blueGrey,
                        )
                    ),
                  ],
                ),
              );
            },
          );
        })
    );
  }
}
