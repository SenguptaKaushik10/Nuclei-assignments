import 'dart:io';
import 'package:assignment2/strings/command_line_menu_string.dart';

class CommandLineMenu {
  static int userMenu() {
    int? option;
    print(CommandLineMenuString.OPTION_SELECTION_STRING);
    print(CommandLineMenuString.ADD_USER_DETAILS_STRING);
    print(CommandLineMenuString.DISPLAY_USER_DETAILS_STRING);
    print(CommandLineMenuString.DELETE_USER_DETAILS_STRING);
    print(CommandLineMenuString.SAVE_USER_DETAILS_STRING);
    print(CommandLineMenuString.EXIT_STRING);
    option = int.parse(stdin.readLineSync()!);
    return option;
  }
}
