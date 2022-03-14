// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Courses _$CoursesFromJson(Map<String, dynamic> json) => Courses(
      (json['courses'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CoursesToJson(Courses instance) => <String, dynamic>{
      'courses': instance.courses,
    };
