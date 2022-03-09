import 'package:assignment1/models/item_details.dart';
//import 'package:assignment1/models/print_class_for_raw_and_manufactured_items.dart';

class ManufacturedItems extends ItemDetails {
  String? itemName, itemType;
  double? itemPrice, itemQuantity;
  static const TAX_PERCENTAGE = 0.125;
  static const TAX_PERCENTAGE_PLUS_SURCHARGE = 0.02;
  ManufacturedItems(
      this.itemName, this.itemPrice, this.itemQuantity, this.itemType);

  @override
  double calculateTax() {
    return TAX_PERCENTAGE * itemPrice!;
  }

  @override
  double calculateFinalPrice(double tax) {
    return itemQuantity! *
        (tax + TAX_PERCENTAGE_PLUS_SURCHARGE * (itemPrice! + tax) + itemPrice!);
  }
}
