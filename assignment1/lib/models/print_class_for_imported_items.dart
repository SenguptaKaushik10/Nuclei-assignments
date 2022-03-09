import 'package:assignment1/strings/strings_for_output.dart';

class PrintImportedItems {
  static const SURCHARGE_PERCENTAGE_IF_PRICE_GREATER_THAN_TWO_HUNDRED = 0.05;
  static const FINAL_COST_LOWER_HAND = 100;
  static const FINAL_COST_UPPER_HAND = 200;
  static void printFunction(itemName, itemPrice, importDuty,
      totalPriceOfImportedItem, itemQuantity, finalPrice) {
    print('${StringsForOutput.OUTPUT_ITEM_NAME} $itemName');
    print('${StringsForOutput.OUTPUT_ITEM_PRICE} $itemPrice');
    print('${StringsForOutput.OUTPUT_ITEM_QUANTITY} $itemQuantity');
    print('${StringsForOutput.OUTPUT_ITEM_IMPORT_DUTY} $importDuty');
    if (finalPrice <= FINAL_COST_LOWER_HAND) {
      print(StringsForOutput.OUTPUT_FOR_SURCHARGE_5);
    } else if (finalPrice > FINAL_COST_LOWER_HAND &&
        finalPrice <= FINAL_COST_UPPER_HAND) {
      print(StringsForOutput.OUTPUT_FOR_SURCHARGE_10);
    } else {
      print(
          '${StringsForOutput.OUTPUT_FOR_SURCHARGE_5_PERCENT} ${SURCHARGE_PERCENTAGE_IF_PRICE_GREATER_THAN_TWO_HUNDRED * finalPrice}');
    }
    print(
        '${StringsForOutput.OUTPUT_ITEM_FINAL_PRICE} $totalPriceOfImportedItem');
  }
}
