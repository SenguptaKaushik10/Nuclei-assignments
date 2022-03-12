import 'package:assignment2/models/user.dart';
import 'package:assignment2/strings/strings_for_exception.dart';

class PrintClass {
  static printFunction(
      List<User> allStudents, int sortingArgument, int sortingOrder) {
    switch (sortingArgument) {
      case 1:
        if (sortingOrder == 1) {
          allStudents.sort((a, b) => a.fullName!.compareTo(b.fullName!));
          for (var student in allStudents) {
            print(
                '${student.fullName}  ${student.rollNo}  ${student.age}  ${student.address?.street}, ${student.address?.city}, ${student.address?.state}, ${student.address?.zip}   ${student.setOfCourses?.courses!.join(', ')}');
          }
        } else if (sortingOrder == 2) {
          allStudents.sort((a, b) => a.fullName!.compareTo(b.fullName!));
          Iterable<User> allStudentsReversed = allStudents.reversed;
          for (var student in allStudentsReversed) {
            print(
                '${student.fullName}  ${student.rollNo}  ${student.age}  ${student.address?.street}, ${student.address?.city}, ${student.address?.state}, ${student.address?.zip}   ${student.setOfCourses?.courses!.join(', ')}');
          }
        }
        break;
      case 2:
        if (sortingOrder == 1) {
          allStudents.sort((a, b) => a.rollNo!.compareTo(b.rollNo!));
          for (var student in allStudents) {
            print(
                '${student.fullName}  ${student.rollNo}  ${student.age}  ${student.address?.street}, ${student.address?.city}, ${student.address?.state}, ${student.address?.zip}   ${student.setOfCourses?.courses!.join(', ')}');
          }
        } else if (sortingOrder == 2) {
          allStudents.sort((a, b) => a.rollNo!.compareTo(b.rollNo!));
          Iterable<User> allStudentsReversed = allStudents.reversed;
          for (var student in allStudentsReversed) {
            print(
                '${student.fullName}  ${student.rollNo}  ${student.age}  ${student.address?.street}, ${student.address?.city}, ${student.address?.state}, ${student.address?.zip}   ${student.setOfCourses?.courses!.join(', ')}');
          }
        }
        break;
      case 3:
        if (sortingOrder == 1) {
          allStudents.sort((a, b) => a.age!.compareTo(b.age!));
          for (var student in allStudents) {
            print(
                '${student.fullName}  ${student.rollNo}  ${student.age}  ${student.address?.street}, ${student.address?.city}, ${student.address?.state}, ${student.address?.zip}   ${student.setOfCourses?.courses!.join(', ')}');
          }
        } else if (sortingOrder == 2) {
          allStudents.sort((a, b) => a.age!.compareTo(b.age!));
          Iterable<User> allStudentsReversed = allStudents.reversed;
          for (var student in allStudentsReversed) {
            print(
                '${student.fullName}  ${student.rollNo}  ${student.age}  ${student.address?.street}, ${student.address?.city}, ${student.address?.state}, ${student.address?.zip}   ${student.setOfCourses?.courses!.join(', ')}');
          }
        }
        break;
      case 4:
        if (sortingOrder == 1) {
          allStudents
              .sort((a, b) => a.address!.state.compareTo(b.address!.state));
          for (var student in allStudents) {
            print(
                '${student.fullName}  ${student.rollNo}  ${student.age}  ${student.address?.street}, ${student.address?.city}, ${student.address?.state}, ${student.address?.zip}   ${student.setOfCourses?.courses!.join(', ')}');
          }
        } else if (sortingOrder == 2) {
          allStudents
              .sort((a, b) => a.address!.state.compareTo(b.address!.state));
          Iterable<User> allStudentsReversed = allStudents.reversed;
          for (var student in allStudentsReversed) {
            print(
                '${student.fullName}  ${student.rollNo}  ${student.age}  ${student.address?.street}, ${student.address?.city}, ${student.address?.state}, ${student.address?.zip}   ${student.setOfCourses?.courses!.join(', ')}');
          }
        }
        break;
      default:
        print(StringsForException.FORMAT_EXCEPTION_STRING);
        break;
    }
  }
}
