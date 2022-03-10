import 'package:assignment1/models/item_details.dart';

class ManufacturedItems extends ItemDetails {
  String? itemName, itemType;
  double? itemPrice, itemQuantity;
  static const TAX_ON_MANUFACTURED_ITEM = 0.125;
  static const TAX_SURCHARGE = 0.02;
  ManufacturedItems(
      this.itemName, this.itemPrice, this.itemQuantity, this.itemType);

  @override
  double calculateTax() {
    return TAX_ON_MANUFACTURED_ITEM * itemPrice!;
  }

  @override
  double calculateFinalPrice(double tax) {
    return itemQuantity! *
        (tax + TAX_SURCHARGE * (itemPrice! + tax) + itemPrice!);
  }
}
