import 'package:contacts_service/contacts_service.dart';
import 'package:hive/hive.dart';

part 'contacts.g.dart';

@HiveType(typeId: 0)
class Contacts{
  // @HiveField(0)
  // String firstName;
  // @HiveField(1)
  // String lastName;
  // @HiveField(2)
  // String? phoneNo;
  // @HiveField(3)
  // String identifier;
  @HiveField(0)
  Map<dynamic,dynamic> contactDetails;


  // @HiveField(0)
  // List<Contact> hiveContactsList;

  Contacts({required this.contactDetails});
}