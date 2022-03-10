import 'package:assignment1/models/item_details.dart';

class RawItems extends ItemDetails {
  String? itemName, itemType;
  double? itemPrice, itemQuantity;
  static const TAX_ON_RAW_ITEMS = 0.125;
  RawItems(this.itemName, this.itemPrice, this.itemQuantity, this.itemType);

  @override
  double calculateTax() {
    return TAX_ON_RAW_ITEMS * itemPrice!;
  }

  @override
  double calculateFinalPrice(double tax) {
    return itemQuantity! * (tax + itemPrice!);
  }
}
