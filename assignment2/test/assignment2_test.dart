import 'package:assignment2/exceptions/exception_handling.dart';
import 'package:assignment2/models/address.dart';
import 'package:assignment2/models/courses.dart';
import 'package:assignment2/models/user.dart';
import 'package:assignment2/storage/session_storage.dart';
import 'package:assignment2/utils/validation_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Exceptions testing', () {
    group('Test if age is valid', () {
      test('Test if age is greater than 40', () {
        expect(() => ValidationUtils.checkIfAgeIsValid(45),
            throwsA(isA<InvalidAgeException>()));
      });
      test('Test if age is less than 18', () {
        expect(() => ValidationUtils.checkIfAgeIsValid(15),
            throwsA(isA<InvalidAgeException>()));
      });
    });

    group('Test if ZIP is valid', () {
      test('Test if 000000', () {
        expect(() => ValidationUtils.checkIfZipIsValid(000000),
            throwsA(isA<InvalidZipException>()));
      });
      test('Test if negative', () {
        expect(() => ValidationUtils.checkIfZipIsValid(-568496),
            throwsA(isA<InvalidZipException>()));
      });
      test('Test if ZIP is not of 6 digits', () {
        expect(() => ValidationUtils.checkIfZipIsValid(12345),
            throwsA(isA<InvalidZipException>()));
      });
    });
    test('Check if roll number is not unique', () {
      User student = User(
          'Kaushik',
          23,
          Address('CKB Road', 'Tsk', 'Assam', 786145),
          19,
          Courses(['A', 'B', 'C', 'D']));
      SessionStorage.instance.addUserDetails(student);
      expect(
          () => ValidationUtils.checkIfRollNoIsUnique(
              19, SessionStorage.instance.getuserDetails()),
          throwsA(isA<NotUniqueRollNoException>()));
    });
    group('Test if all courses are valid', () {
      test('If all four tests not entered', () {
        expect(
            () => ValidationUtils.checkIfAllCoursesAreValidAndUnique(
                ['A', 'B', 'D']),
            throwsA(isA<AllCoursesNotUniqueOrValidException>()));
      });
      test('If all four courses are not unique', () {
        expect(
            () => ValidationUtils.checkIfAllCoursesAreValidAndUnique(
                ['A', 'B', 'F', 'B']),
            throwsA(isA<AllCoursesNotUniqueOrValidException>()));
      });
    });
    test('Test if option selected for sorting argument is valid', () {
      expect(() => ValidationUtils.checkIfSortingArgumentIsValid(5),
          throwsA(isA<InvalidSortingArgumentSelectionException>()));
    });
    test('Test if option selected for sorting order is valid', () {
      expect(() => ValidationUtils.checkIfSortingOrderIsValid(4),
          throwsA(isA<InvalidSortingOrderSelectionException>()));
    });
    test('Check if all names are not unique', () {
      User student = User(
          'Kaushik',
          23,
          Address('CKB Road', 'Tsk', 'Assam', 786145),
          19,
          Courses(['A', 'B', 'C', 'D']));
      SessionStorage.instance.addUserDetails(student);
      User student1 = User(
          'Kaushik',
          50,
          Address('WhiteField', 'Bengaluru', 'Karnataka', 560066),
          12,
          Courses(['A', 'C', 'E', 'B']));
      SessionStorage.instance.addUserDetails(student1);
      expect(
          () => ValidationUtils.checkIfAllFullNamesAreUnique(
              SessionStorage.instance.getuserDetails()),
          throwsA(isA<AllUserFullNamesNotUniqueException>()));
    });
  });
}
