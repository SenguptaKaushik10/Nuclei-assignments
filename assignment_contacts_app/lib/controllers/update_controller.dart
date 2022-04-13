import 'package:assignment_contacts_app/models/contacts.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController{
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  late Contact updateContact;

  void updateContactFunction(Contact contact){
    updateContact = contact;
    updateContact.identifier = contact.identifier;
    firstNameController.text = contact.givenName!;
    lastNameController.text = contact.familyName!;
    phoneNumberController.text = contact.phones?.elementAt(0).value ?? '';
  }
}