import 'package:assignment2/exceptions/exception_handling.dart';
import 'package:assignment2/models/user.dart';

class ValidationUtils {
  static void checkIfAgeIsValid(int age) {
    if (age < 18 || age > 40) {
      throw InvalidAgeException();
    }
  }

  static void checkIfZipIsValid(int zip) {
    if ('$zip'.length != 6) {
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
      throw AllCoursesNotUniqueException();
    } else {
      for (int i = 0; i < listOfCourses.length - 1; i++) {
        for (int j = 0; j < listOfCourses.length; j++) {
          if (listOfCourses[i] == listOfCourses[j]) {
            throw AllCoursesNotUniqueException();
          }
        }
      }
    }
  }
}
