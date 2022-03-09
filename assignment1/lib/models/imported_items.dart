import 'package:assignment1/models/item_details.dart';
//import 'package:assignment1/models/print_class_for_imported_items.dart';

class ImportedItems extends ItemDetails {
  String? itemName, itemType;
  double? itemPrice, itemQuantity;
  static const IMPORT_DUTY_PERCENTAGE = 0.1;
  static const SURCHARGE_IF_PRICE_LESS_THAN_OR_EQUAL_TO_HUNDRED = 5.0;
  static const SURCHARGE_IF_PRICE_GREATER_THAN_HUNDRED_AND_LESS_THAN_OR_EQUAL_TO_TWO_HUNDRED =
      10.0;
  static const SURCHARGE_PERCENTAGE_IF_PRICE_GREATER_THAN_TWO_HUNDRED = 0.05;
  static const FINAL_COST_LOWER_HAND = 100.0;
  static const FINAL_COST_UPPER_HAND = 200.0;
  ImportedItems(
      this.itemName, this.itemPrice, this.itemQuantity, this.itemType);

  // calculate import duty of imported items
  @override
  double calculateTax() {
    return IMPORT_DUTY_PERCENTAGE * itemPrice!;
  }

  // final price here implies cost per unit after applying import duty
  @override
  double calculateFinalPrice(double tax) {
    return itemPrice! + tax;
  }

  // total price of imported item implies cost per uni after applying surcharge
  double calculateTotalPriceOfImportedItem(double newPrice) {
    if (newPrice <= FINAL_COST_LOWER_HAND) {
      return itemQuantity! *
          (SURCHARGE_IF_PRICE_LESS_THAN_OR_EQUAL_TO_HUNDRED + newPrice);
    } else if (newPrice > FINAL_COST_LOWER_HAND &&
        newPrice <= FINAL_COST_UPPER_HAND) {
      return itemQuantity! *
          (SURCHARGE_IF_PRICE_GREATER_THAN_HUNDRED_AND_LESS_THAN_OR_EQUAL_TO_TWO_HUNDRED +
              newPrice);
    } else {
      return itemQuantity! *
          (SURCHARGE_PERCENTAGE_IF_PRICE_GREATER_THAN_TWO_HUNDRED * newPrice +
              newPrice);
    }
  }
}
