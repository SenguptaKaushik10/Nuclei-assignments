import 'package:assignment1/models/item_details.dart';
//import 'package:assignment1/models/print_class_for_raw_and_manufactured_items.dart';

class RawItems extends ItemDetails {
  String? itemName, itemType;
  double? itemPrice, itemQuantity;
  static const TAX_PERCENTAGE = 0.125;
  RawItems(this.itemName, this.itemPrice, this.itemQuantity, this.itemType);

  @override
  double calculateTax() {
    return 0.125 * itemPrice!;
  }

  @override
  double calculateFinalPrice(double tax) {
    return itemQuantity! * (tax + itemPrice!);
  }
}
