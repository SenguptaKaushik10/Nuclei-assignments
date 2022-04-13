import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:assignment_contacts_app/views/home_page.dart';
import 'package:get/get.dart';

Future<PermissionStatus> getPermission() async {
  final PermissionStatus permission = await Permission.contacts.status;
  if (permission != PermissionStatus.granted &&
      permission != PermissionStatus.denied) {
    final Map<Permission, PermissionStatus> permissionStatus =
        await [Permission.contacts].request();
    return permissionStatus[Permission.contacts] ?? PermissionStatus.granted;
  } else {
    return permission;
  }
}

class GetContactPermission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: getPermission(),
      builder: (context, AsyncSnapshot snapshot){
      //print(snapshot.connectionState);
      switch (snapshot.connectionState){
        case ConnectionState.done:
          if(snapshot.data == PermissionStatus.granted){
            return HomePage();
          }
          break;
        default: return Scaffold();
      }
      return CircularProgressIndicator.adaptive();

      });

  }
}
