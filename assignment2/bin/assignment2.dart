import 'dart:io';
import 'package:assignment2/exceptions/exception_handling.dart';
import 'package:assignment2/models/address.dart';
import 'package:assignment2/models/command_line_menu.dart';
import 'package:assignment2/models/courses.dart';
import 'package:assignment2/models/print_class.dart';
import 'package:assignment2/models/user.dart';
import 'package:assignment2/utils/validation_utils.dart';

void main() {
  List<User> allStudents = [];
  OuterLoop:
  while (true) {
    int option = CommandLineMenu.userMenu();
    SwitchCase:
    switch (option) {
      case 1:
        print('Enter your full name: ');
        String fullName = stdin.readLineSync()!;
        print('Enter your age: ');
        int? age = int.parse(stdin.readLineSync()!);
        try {
          ValidationUtils.checkIfAgeIsValid(age);
        } on InvalidAgeException {
          print('Please enter age between 18 to 40');
          break SwitchCase;
        }
        print('Enter your address as: ');
        print('Street: ');
        String? street = stdin.readLineSync();
        print('City: ');
        String? city = stdin.readLineSync();
        print('State: ');
        String? state = stdin.readLineSync();
        print('ZIP: ');
        int? zip = int.parse(stdin.readLineSync()!);
        try {
          ValidationUtils.checkIfZipIsValid(zip);
        } on InvalidZipException {
          print('Please enter a valid ZIP code');
          break SwitchCase;
        }
        Address? address = Address(street!, city!, state!, zip);
        print('Enter your Roll number: ');
        int rollNo = int.parse(stdin.readLineSync()!);
        try {
          ValidationUtils.checkIfRollNoIsUnique(rollNo, allStudents);
        } on NotUniqueRollNoException {
          print(
              "This Roll number is already taken, please enter a unique Roll number");
          break SwitchCase;
        }
        print('Enter the four courses that you want to opt for: ');
        String stringOfCourses = stdin.readLineSync()!;
        List<String> listOfCourses = stringOfCourses.split(RegExp('\\s+'));
        //space separated string
        try {
          ValidationUtils.checkIfAllCoursesAreValidAndUnique(listOfCourses);
        } on AllCoursesNotUniqueException {
          print('Please enter all four unique courses');
          break SwitchCase;
        }
        Courses courses = Courses(listOfCourses);
        User student = User(fullName, age, address, rollNo, courses);
        allStudents.add(student);
        //check if names are unique, if not, then sort on the basis of rollno.
        allStudents.sort((a, b) => a.fullName!.compareTo(b.fullName!));
        break SwitchCase;
      case 2:
        print('Enter the choice of argument on whose basis you want to sort: ');
        print('1. Full name');
        print('2. Roll number');
        print('3. Age');
        print('4. Address');
        int? sortingArgument = int.parse(stdin.readLineSync()!);
        print("Enter the order in which you want to sort: ");
        print('1. Ascending order');
        print('2. Descending order');
        int? sortingOrder = int.parse(stdin.readLineSync()!);
        print(
            '------------------------------------------------------------------------------------------------------------');
        print(
            'Name             Roll Number   Age   Address                               Courses');
        print(
            '------------------------------------------------------------------------------------------------------------');
        Print.printFunction(allStudents, sortingArgument, sortingOrder);
        break SwitchCase;
      case 3:
        print(
            "Enter the Roll Number of student whose details you want to delete: ");
        int rollNoToBeDeleted = int.parse(stdin.readLineSync()!);
        //check if roll no not present in set of students
        int flag = 0;
        InnerForLoop:
        for (var student in allStudents) {
          if (student.rollNo == rollNoToBeDeleted) {
            flag = 1;
            break InnerForLoop;
          }
        }
        if (flag == 0) {
          print(
              'The Roll number you have entered does not belong to any valid student');
          break SwitchCase;
        }
        allStudents
            .removeWhere((student) => student.rollNo == rollNoToBeDeleted);
        break SwitchCase;
      case 4:
        break SwitchCase;
      case 5:
        print("Exitting...");
        break OuterLoop;
      default:
        print("Please select a valid option");
        break SwitchCase;
    }
  }
}
