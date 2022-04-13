import 'package:assignment_contacts_app/models/contacts.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


class ContactListController extends GetxController {
  var contactsList = <Contact>[].obs;
  final contactsBox = Hive.box<Contacts>('contacts');

  @override
  void onInit() {
    super.onInit();
    getAllContacts();
  }

  void addContact(Contact contact) {
    contactsBox.put(contact.identifier, Contacts(contactDetails: contact.toMap()));
  }

  void getAllContacts() async {
    if (contactsBox.isEmpty) {
      var contacts = await ContactsService.getContacts();
      //contacts.sort();
      contactsList.value = contacts;
      contacts.forEach((contact) {
        print('${contact.givenName} ${contact.identifier}');
      });
      contactsList.sort((a, b) => a.givenName!.compareTo(b.givenName!));
      contactsList.forEach((contact) {
        contact.toMap();
        addContact(contact);
      });
    }
    else{
      var contacts = contactsBox.values.toList();
      contacts.forEach((contact) {
        contactsList.add(Contact.fromMap(contact.contactDetails));
      });
      contactsList.sort((a, b) => a.givenName!.compareTo(b.givenName!));
    }
  }
}