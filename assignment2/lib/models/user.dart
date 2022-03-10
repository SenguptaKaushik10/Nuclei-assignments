import 'package:json_annotation/json_annotation.dart';
import 'package:assignment2/models/address.dart';
import 'package:assignment2/models/courses.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? fullName;
  int? age, rollNo;
  Address? address;
  Courses? setOfCourses;

  User(this.fullName, this.age, this.address, this.rollNo, this.setOfCourses);

  //map<String, dynamic>
  factory User.fromJson(Map<String, String> data) => _$UserFromJson(data);

  //Map<String, dynamic>
  Map<String, String> toJson() => _$UserToJson(this);
}
