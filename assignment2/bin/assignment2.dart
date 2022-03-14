import 'dart:io';
import 'package:assignment2/exceptions/exception_handling.dart';
import 'package:assignment2/models/address.dart';
import 'package:assignment2/models/command_line_menu.dart';
import 'package:assignment2/models/courses.dart';
import 'package:assignment2/models/print_class.dart';
import 'package:assignment2/models/user.dart';
import 'package:assignment2/storage/session_storage.dart';
import 'package:assignment2/strings/command_line_menu_string.dart';
import 'package:assignment2/strings/input_output_strings.dart';
import 'package:assignment2/strings/strings_for_exception.dart';
import 'package:assignment2/utils/validation_utils.dart';

void main() {
  SessionStorage.instance.readUserDetails();
  OuterLoop:
  while (true) {
    int option = CommandLineMenu.userMenu();
    try {
      ValidationUtils.checkIfOptionSelectedForMenuIsValid(option);
    } on InvalidOptionForMenuSelectionException {
      print(StringsForException
          .INVALID_OPTION_FOR_MENU_SELECTION_EXCEPTION_STRING);
      break;
    } on FormatException {
      print(StringsForException.FORMAT_EXCEPTION_STRING);
      break;
    }
    SwitchCase:
    switch (option) {
      case 1:
        print(InputOutputStrings.ENTER_FULL_NAME_STRING);
        String fullName;
        try {
          fullName = stdin.readLineSync()!;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break SwitchCase;
        }
        print(InputOutputStrings.ENTER_AGE_STRING);
        int? age = int.parse(stdin.readLineSync()!);
        try {
          ValidationUtils.checkIfAgeIsValid(age);
        } on InvalidAgeException {
          print(StringsForException.INVALID_AGE_EXCEPTION_STRING);
          break SwitchCase;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break SwitchCase;
        }
        print(InputOutputStrings.ENTER_ADDRESS_STRING);
        String? street, city, state;
        try {
          print(InputOutputStrings.ENTER_STREET_STRING);
          street = stdin.readLineSync();
          print(InputOutputStrings.ENTER_CITY_STRING);
          city = stdin.readLineSync();
          print(InputOutputStrings.ENTER_STATE_STRING);
          state = stdin.readLineSync();
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break SwitchCase;
        }
        print(InputOutputStrings.ENTER_ZIP_STRING);
        int? zip = int.parse(stdin.readLineSync()!);
        try {
          ValidationUtils.checkIfZipIsValid(zip);
        } on InvalidZipException {
          print(StringsForException.INVALID_ZIP_EXCEPTION_STRING);
          break SwitchCase;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break SwitchCase;
        }
        Address? address = Address(street!, city!, state!, zip);
        print(InputOutputStrings.ENTER_ROLL_NO_STRING);
        int rollNo = int.parse(stdin.readLineSync()!);
        try {
          ValidationUtils.checkIfRollNoIsUnique(
              rollNo, SessionStorage.instance.getuserDetails());
        } on NotUniqueRollNoException {
          print(StringsForException.NOT_UNIQUE_ROLL_NO_EXCEPTION_STRING);
          break SwitchCase;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break SwitchCase;
        }
        print(InputOutputStrings.ENTER_COURSES_STRING);
        String stringOfCourses = stdin.readLineSync()!;
        List<String> listOfCourses = stringOfCourses.split(RegExp('\\s+'));
        //space separated string
        try {
          ValidationUtils.checkIfAllCoursesAreValidAndUnique(listOfCourses);
        } on AllCoursesNotUniqueOrValidException {
          print(StringsForException.ALL_COURSES_NOT_UNIQUE_OR_VALID_EXCEPTION);
          break SwitchCase;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break SwitchCase;
        }
        Courses courses = Courses(listOfCourses);
        User student = User(fullName, age, address, rollNo, courses);
        //getters and setters of allstudents list
        SessionStorage.instance.addUserDetails(student);
        //check if names are unique, if not, then sort on the basis of rollno.
        try {
          ValidationUtils.checkIfAllFullNamesAreUnique(
              SessionStorage.instance.getuserDetails());
        } on AllUserFullNamesNotUniqueException {
          SessionStorage.instance
              .getuserDetails()
              .sort((a, b) => a.rollNo!.compareTo(b.rollNo!));
        }
        SessionStorage.instance
            .getuserDetails()
            .sort((a, b) => a.fullName!.compareTo(b.fullName!));
        break SwitchCase;
      case 2:
        print(InputOutputStrings.ENTER_CHOICE_OF_SORTING_ARGUMENT_STRING);
        print(InputOutputStrings.OPTION_FULL_NAME_STRING);
        print(InputOutputStrings.OPTION_ROLL_NO_STRING);
        print(InputOutputStrings.OPTION_AGE_STRING);
        print(InputOutputStrings.OPTION_ADDRESS_STRING);
        int? sortingArgumentIndex = int.parse(stdin.readLineSync()!);
        try {
          ValidationUtils.checkIfSortingArgumentIsValid(sortingArgumentIndex);
        } on InvalidSortingArgumentSelectionException {
          print(
              StringsForException.INVALID_SORTING_ARGUMENT_SELECTION_EXCEPTION);
          break SwitchCase;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break SwitchCase;
        }
        print(InputOutputStrings.ENTER_CHOICE_OF_SORTING_ORDER_STRING);
        print(InputOutputStrings.OPTION_ASCENDING_ORDER_STRING);
        print(InputOutputStrings.OPTION_DESCENDING_ORDER_STRING);
        int? sortingOrderIndex = int.parse(stdin.readLineSync()!);
        try {
          ValidationUtils.checkIfSortingOrderIsValid(sortingOrderIndex);
        } on InvalidSortingOrderSelectionException {
          print(StringsForException.INVALID_SORTING_ORDER_SELECTION_EXCEPTION);
          break SwitchCase;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break SwitchCase;
        }
        print(InputOutputStrings.DASH_STRING_FOR_TABLE_DISPLAY);
        print(InputOutputStrings.TABLE_HEADER_STRING);
        print(InputOutputStrings.DASH_STRING_FOR_TABLE_DISPLAY);
        PrintClass.printFunction(SessionStorage.instance.getuserDetails(),
            sortingArgumentIndex, sortingOrderIndex);
        break SwitchCase;
      case 3:
        print(InputOutputStrings.ENTER_ROLL_NO_TO_BE_DELETED_STRING);
        int rollNoToBeDeleted = int.parse(stdin.readLineSync()!);
        //check if roll no not present in set of students
        int flag = 0;
        InnerForLoop:
        for (var student in SessionStorage.instance.getuserDetails()) {
          if (student.rollNo == rollNoToBeDeleted) {
            flag = 1;
            break InnerForLoop;
          }
        }
        if (flag == 0) {
          print(InputOutputStrings.INVALID_ROLL_NO_FOR_DELETION_STRING);
          break SwitchCase;
        }
        SessionStorage.instance.deleteUserDetails(rollNoToBeDeleted);
        print(CommandLineMenuString.USER_DETAILS_DELETED_STRING);
        break SwitchCase;
      case 4:
        SessionStorage.instance.saveUserDetails();
        print(CommandLineMenuString.USER_DETAILS_SAVED_STRING);
        break SwitchCase;
      case 5:
        const YES = 'y';
        print(InputOutputStrings.BEFORE_EXIT_SAVE_PROMPT_STRING);
        print(InputOutputStrings.YES_NO_STRING);
        String inputChar = stdin.readLineSync()!;
        switch (inputChar.toLowerCase()) {
          case 'y':
            SessionStorage.instance.saveUserDetails();
            print(CommandLineMenuString.EXIT_MESSAGE_STRING);
            break OuterLoop;
          case 'n':
            print(CommandLineMenuString.EXIT_MESSAGE_STRING);
            break OuterLoop;
          default:
            print(CommandLineMenuString.DEFAULT_STRING);
            break SwitchCase;
        }
      default:
        print(CommandLineMenuString.DEFAULT_STRING);
        break SwitchCase;
    }
  }
}
