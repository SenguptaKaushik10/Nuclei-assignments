import 'dart:ffi';

import 'package:assignment2/exceptions/exception_handling.dart';
import 'package:assignment2/models/user.dart';

class ValidationUtils {
  static void checkIfOptionSelectedForMenuIsValid(int option) {
    if (option < 1 || option > 5) {
      throw InvalidOptionForMenuSelectionException();
    }
  }

  static void checkIfAgeIsValid(int age) {
    if (age < 18 || age > 40) {
      throw InvalidAgeException();
    }
  }

  static void checkIfZipIsValid(int zip) {
    if ('$zip'.length != 6 || zip <= 000000) {
      throw InvalidZipException();
    }
  }

  static void checkIfRollNoIsUnique(int newRollNo, List<User> allStudents) {
    for (var student in allStudents) {
      if (newRollNo == student.rollNo) {
        throw NotUniqueRollNoException();
      }
    }
  }

  static void checkIfAllCoursesAreValidAndUnique(List<String> listOfCourses) {
    if (listOfCourses.length != 4) {
      throw AllCoursesNotUniqueOrValidException();
    } else {
      for (int i = 0; i < listOfCourses.length - 1; i++) {
        for (int j = i + 1; j < listOfCourses.length; j++) {
          if (listOfCourses[i] == listOfCourses[j]) {
            throw AllCoursesNotUniqueOrValidException();
          }
        }
      }
    }
  }

  static void checkIfSortingArgumentIsValid(int sortingArgumentIndex) {
    if (sortingArgumentIndex < 1 || sortingArgumentIndex > 4) {
      throw InvalidSortingArgumentSelectionException();
    }
  }

  static void checkIfSortingOrderIsValid(int sortingOrderIndex) {
    if (sortingOrderIndex < 1 || sortingOrderIndex > 2) {
      throw InvalidSortingOrderSelectionException();
    }
  }

  static void checkIfAllFullNamesAreUnique(List<User> allUsers) {
    for (int i = 0; i < allUsers.length - 1; i++) {
      for (int j = i + 1; j < allUsers.length; j++) {
        if (allUsers[i].fullName == allUsers[j].fullName) {
          throw AllUserFullNamesNotUniqueException();
        }
      }
    }
  }
}
