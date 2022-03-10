import 'package:assignment1/models/item_details.dart';

class ImportedItems extends ItemDetails {
  String? itemName, itemType;
  double? itemPrice, itemQuantity;
  static const IMPORT_DUTY = 0.1;
  static const FINAL_COST_LOWER_LIMIT = 100.0;
  static const FINAL_COST_UPPER_LIMIT = 200.0;
  static const SURCHARGE_IF_COST_LESS_THAN_OR_EQUAL_TO_LOWER_LIMIT = 5.0;
  static const SURCHARGE_IF_COST_MORE_THAN_LOWER_LIMIT_AND_LESS_THAN_OR_EQUAL_TO_UPPER_LIMIT =
      10.0;
  static const SURCHARGE_PERCENTAGE_IF_COST_MORE_THAN_UPPER_LIMIT = 0.05;
  ImportedItems(
      this.itemName, this.itemPrice, this.itemQuantity, this.itemType);

  // calculate import duty of imported items
  @override
  double calculateTax() {
    return IMPORT_DUTY * itemPrice!;
  }

  // final price here implies cost per unit after applying import duty
  @override
  double calculateFinalPrice(double tax) {
    return itemPrice! + tax;
  }

  // total price of imported item implies cost per uni after applying surcharge
  double calculateTotalPriceOfImportedItem(double newPrice) {
    if (newPrice <= FINAL_COST_LOWER_LIMIT) {
      return itemQuantity! *
          (SURCHARGE_IF_COST_LESS_THAN_OR_EQUAL_TO_LOWER_LIMIT + newPrice);
    } else if (newPrice > FINAL_COST_LOWER_LIMIT &&
        newPrice <= FINAL_COST_UPPER_LIMIT) {
      return itemQuantity! *
          (SURCHARGE_IF_COST_MORE_THAN_LOWER_LIMIT_AND_LESS_THAN_OR_EQUAL_TO_UPPER_LIMIT +
              newPrice);
    } else {
      return itemQuantity! *
          (SURCHARGE_PERCENTAGE_IF_COST_MORE_THAN_UPPER_LIMIT * newPrice +
              newPrice);
    }
  }
}
