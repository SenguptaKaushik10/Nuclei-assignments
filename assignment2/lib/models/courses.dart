import 'package:json_annotation/json_annotation.dart';

part 'courses.g.dart';

@JsonSerializable()
class Courses {
  List<String>? courses;

  Courses(this.courses);

  factory Courses.fromJson(Map<String, dynamic> data) =>
      _$CoursesFromJson(data);

  Map<String, dynamic> toJson() => _$CoursesToJson(this);
}
