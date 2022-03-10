import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String street = '', city = '', state = '';
  int zip = 000000;

  Address(this.street, this.city, this.state, this.zip);

  factory Address.fromJson(Map<String, String> data) => _$AddressFromJson(data);

  Map<String, String> toJson() => _$AddressToJson(this);
}
