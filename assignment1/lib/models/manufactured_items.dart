import 'package:assignment1/models/item_details.dart';
//import 'package:assignment1/models/print_class_for_raw_and_manufactured_items.dart';

class ManufacturedItems extends ItemDetails {
  String? itemName, itemType;
  double? itemPrice, itemQuantity;
  ManufacturedItems(
      this.itemName, this.itemPrice, this.itemQuantity, this.itemType);

  @override
  double calculateTax() {
    return 0.125 * itemPrice!;
  }

  @override
  double calculateFinalPrice(double tax) {
    return itemQuantity! * (tax + 0.02 * (itemPrice! + tax) + itemPrice!);
  }
}
