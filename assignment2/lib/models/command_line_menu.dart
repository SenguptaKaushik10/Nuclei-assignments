//import 'dart:io';

import 'dart:io';

class CommandLineMenu {
  static int userMenu() {
    int? option;
    print("Select an option: ");
    print("1. Add User details");
    print("2. Display User details");
    print("3. Delete User details");
    print("4. Save User details");
    print("5. Exit");
    option = int.parse(stdin.readLineSync()!);
    return option;
  }
}
