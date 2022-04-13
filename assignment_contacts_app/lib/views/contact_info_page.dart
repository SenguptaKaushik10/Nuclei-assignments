import 'package:assignment_contacts_app/controllers/contact_list_controller.dart';
import 'package:assignment_contacts_app/models/contacts.dart';
import 'package:assignment_contacts_app/views/update_contact_page.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


class ContactInfoPage extends StatelessWidget {

  Contact thisContact = Get.arguments;
  ContactListController contactsController = Get.put(ContactListController());
  final contactsBox = Hive.box<Contacts>('contacts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                thisContact.givenName!,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                thisContact.familyName!,
                style: TextStyle(
                  fontSize: 35.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 15.0,),
              Row(
                children: [
                  Icon(Icons.phone,
                  size: 30.0,
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    thisContact.phones?.first.value ?? '',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey[900],
        onPressed: () async{
        Contact updatedContact = await Get.to(() => UpdateContactPage(), arguments: thisContact);
        await ContactsService.updateContact(updatedContact);
        thisContact = updatedContact;
        Contacts newUpdatedContact = Contacts(contactDetails: updatedContact.toMap());
        contactsBox.put(thisContact.identifier, newUpdatedContact);
        contactsController.contactsList.refresh();
      },
        child: Icon(
          Icons.edit,
          color: Colors.blueGrey,
        ),

      ),
    );
  }
}
