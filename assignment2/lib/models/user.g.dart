// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['fullName'] as String?,
      json['age'] as int?,
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      json['rollNo'] as int?,
      json['setOfCourses'] == null
          ? null
          : Courses.fromJson(json['setOfCourses'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'age': instance.age,
      'rollNo': instance.rollNo,
      'address': instance.address,
      'setOfCourses': instance.setOfCourses,
    };
