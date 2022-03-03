import 'package:assignment1/strings/strings_for_output.dart';

class PrintImportedItems {
  static void printFunction(itemName, itemPrice, importDuty,
      totalPriceOfImportedItem, itemQuantity, finalPrice) {
    print('${StringsForOutput.OUTPUT_ITEM_NAME} $itemName');
    print('${StringsForOutput.OUTPUT_ITEM_PRICE} $itemPrice');
    print('${StringsForOutput.OUTPUT_ITEM_QUANTITY} $itemQuantity');
    print('${StringsForOutput.OUTPUT_ITEM_IMPORT_DUTY} $importDuty');
    if (finalPrice <= 100) {
      print(StringsForOutput.OUTPUT_FOR_SURCHARGE_5);
    } else if (finalPrice > 100 && finalPrice <= 200) {
      print(StringsForOutput.OUTPUT_FOR_SURCHARGE_10);
    } else {
      print(
          '${StringsForOutput.OUTPUT_FOR_SURCHARGE_5_PERCENT} ${0.05 * finalPrice}');
    }
    print(
        '${StringsForOutput.OUTPUT_ITEM_FINAL_PRICE} $totalPriceOfImportedItem');
  }
}
