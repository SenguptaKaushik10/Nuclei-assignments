import 'package:assignment1/strings/strings_for_output.dart';

class PrintImportedItems {
  static const FINAL_COST_LOWER_LIMIT = 100.0;
  static const FINAL_COST_UPPER_LIMIT = 200.0;
  static const SURCHARGE_PERCENTAGE_IF_COST_MORE_THAN_UPPER_LIMIT = 0.05;
  static void printFunction(itemName, itemPrice, importDuty,
      totalPriceOfImportedItem, itemQuantity, finalPrice) {
    print('${StringsForOutput.OUTPUT_ITEM_NAME} $itemName');
    print('${StringsForOutput.OUTPUT_ITEM_PRICE} $itemPrice');
    print('${StringsForOutput.OUTPUT_ITEM_QUANTITY} $itemQuantity');
    print('${StringsForOutput.OUTPUT_ITEM_IMPORT_DUTY} $importDuty');
    if (finalPrice <= FINAL_COST_LOWER_LIMIT) {
      print(StringsForOutput.OUTPUT_FOR_SURCHARGE_5);
    } else if (finalPrice > FINAL_COST_LOWER_LIMIT &&
        finalPrice <= FINAL_COST_UPPER_LIMIT) {
      print(StringsForOutput.OUTPUT_FOR_SURCHARGE_10);
    } else {
      print(
          '${StringsForOutput.OUTPUT_FOR_SURCHARGE_5_PERCENT} ${SURCHARGE_PERCENTAGE_IF_COST_MORE_THAN_UPPER_LIMIT * finalPrice}');
    }
    print(
        '${StringsForOutput.OUTPUT_ITEM_FINAL_PRICE} $totalPriceOfImportedItem');
  }
}