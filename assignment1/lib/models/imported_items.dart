import 'package:assignment1/models/item_details.dart';
//import 'package:assignment1/models/print_class_for_imported_items.dart';

class ImportedItems extends ItemDetails {
  String? itemName, itemType;
  double? itemPrice, itemQuantity;
  ImportedItems(
      this.itemName, this.itemPrice, this.itemQuantity, this.itemType);

  // calculate import duty of imported items
  @override
  double calculateTax() {
    return 0.1 * itemPrice!;
  }

  // final price here implies cost per unit after applying import duty
  @override
  double calculateFinalPrice(double tax) {
    return itemPrice! + tax;
  }

  // total price of imported item implies cost per uni after applying surcharge
  double calculateTotalPriceOfImportedItem(double newPrice) {
    if (newPrice <= 100.0) {
      return itemQuantity! * (5.0 + newPrice);
    } else if (newPrice > 100.0 && newPrice <= 200.0) {
      return itemQuantity! * (10.0 + newPrice);
    } else {
      return itemQuantity! * (0.05 * newPrice + newPrice);
    }
  }
}
