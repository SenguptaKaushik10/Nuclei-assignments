import 'package:assignment1/strings/strings_for_output.dart';

class PrintRawAndManufacturedItems {
  static void printFunction(
      itemName, itemPrice, tax, finalPrice, itemQuantity) {
    print('${StringsForOutput.OUTPUT_ITEM_NAME} $itemName');
    print('${StringsForOutput.OUTPUT_ITEM_PRICE} $itemPrice');
    print('${StringsForOutput.OUTPUT_ITEM_QUANTITY} $itemQuantity');
    print('${StringsForOutput.OUTPUT_ITEM_TAX} $tax');
    print('${StringsForOutput.OUTPUT_ITEM_FINAL_PRICE} $finalPrice');
  }
}
