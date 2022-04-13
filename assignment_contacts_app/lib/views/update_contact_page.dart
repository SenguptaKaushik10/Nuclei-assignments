import 'package:assignment_contacts_app/controllers/update_controller.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateContactPage extends StatelessWidget {


  final UpdateController updateController = Get.put(UpdateController());
  final String APPBAR_TITLE_STRING = 'Update contact';
  final String FIRST_NAME_LABEL_STRING = 'Enter First Name';
  final String FIRST_NAME_HINT_STRING = 'First Name';
  final String LAST_NAME_LABEL_STRING = 'Enter Last Name';
  final String LAST_NAME_HINT_STRING = 'Last Name';
  final String PHONE_NO_LABEL_STRING = 'Enter Phone Number';
  final String PHONE_NO_HINT_STRING = '9976534231';
  final String ELEVATED_BUTTON_STRING = 'Done';


  @override
  Widget build(BuildContext context) {

    updateController.updateContactFunction(Get.arguments);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text(APPBAR_TITLE_STRING),
          centerTitle: true,
        ),
        body: Stack(children: [
          SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 35.0),
                      child: Column(children: [
                        TextField(
                          controller: updateController.firstNameController,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.blueGrey,
                            filled: true,
                            labelText: FIRST_NAME_LABEL_STRING,
                            hintText: FIRST_NAME_HINT_STRING,
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextField(
                          controller: updateController.lastNameController,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.blueGrey,
                            filled: true,
                            labelText: LAST_NAME_LABEL_STRING,
                            hintText: LAST_NAME_HINT_STRING,
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextField(
                          controller: updateController.phoneNumberController,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.blueGrey,
                            filled: true,
                            labelText: PHONE_NO_LABEL_STRING,
                            hintText: '9976534231',
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                        ),
                        SizedBox(height: 50.0,),
                        ElevatedButton(onPressed: () {
                          updateController.updateContact.givenName = updateController.firstNameController.text;
                          updateController.updateContact.familyName = updateController.lastNameController.text;
                          updateController.updateContact.phones = [Item(value: updateController.phoneNumberController.text)];
                          Get.back(
                              result: updateController.updateContact
                          );
                        },
                            child: Text(ELEVATED_BUTTON_STRING),
                          style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[900],
                          ),
                          ),
                      ]),
                    )
                  ])))
        ]));
  }
}
