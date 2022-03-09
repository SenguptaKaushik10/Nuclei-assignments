import 'package:assignment2/models/address.dart';
import 'package:assignment2/models/courses.dart';

class User {
  String? fullName;
  int? age, rollNo;
  Address? address;
  Courses? setOfCourses;

  User(this.fullName, this.age, this.address, this.rollNo, this.setOfCourses);
}
