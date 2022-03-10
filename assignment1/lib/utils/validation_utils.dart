import 'package:assignment1/exceptions/all_arguments_not_provided_exception.dart';
import 'package:assignment1/exceptions/item_price_negative_or_zero_exception.dart';
import 'package:assignment1/exceptions/item_quantity_negative_or_zero_exception.dart';

class ValidationUtils {
  static void checkIfInputContainsAllArguments(int len) {
    if (len != 8) {
      throw AllArgumentsNotProvidedException();
    }
  }

  static void checkIfItemPriceNegativeOrZero(double price) {
    if (price <= 0) {
      throw ItemPriceNegativeOrZeroException();
    }
  }

  static void checkIfItemQuantityNegativeOrZero(double quantity) {
    if (quantity <= 0) {
      throw ItemQuantityNegativeOrZeroException();
    }
  }
}
