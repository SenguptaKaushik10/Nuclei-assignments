import 'package:assignment_contacts_app/views/home_page.dart';
import 'package:assignment_contacts_app/views/get_contact_permission.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

import 'models/contacts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ContactsAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
         home: FutureBuilder(
           future: Hive.openBox<Contacts>('contacts'),
           builder: (BuildContext context, AsyncSnapshot snapshot){
             print(snapshot.connectionState);
             if(snapshot.connectionState == ConnectionState.done) {
               if (snapshot.hasError) {
                 return Text(snapshot.error.toString());
               } else {
                 return GetContactPermission();
               }
             }
               else{
                 return CircularProgressIndicator.adaptive();
             }
           },
         )
    );
  }
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
