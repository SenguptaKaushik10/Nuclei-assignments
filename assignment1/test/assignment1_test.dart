import 'package:test/test.dart';
import 'package:assignment1/models/raw_items.dart';
import 'package:assignment1/models/manufactured_items.dart';
import 'package:assignment1/models/imported_items.dart';
import 'package:assignment1/utils/validation_utils.dart';
import 'package:assignment1/exceptions/all_arguments_not_provided_exception.dart';
import 'package:assignment1/exceptions/item_price_negative_or_zero_exception.dart';
import 'package:assignment1/exceptions/item_quantity_negative_or_zero_exception.dart';

void main() {
  group('Testing for raw items', () {
    RawItems rawItem = RawItems('Monaco', 100, 10, 'raw');
    test('Item tax', () {
      expect(rawItem.calculateTax(), equals(12.5));
    });
    test('Item total price', () {
      expect(rawItem.calculateFinalPrice(12.5), equals(1125.0));
    });
  });

  group('Testing for manufactured items', () {
    ManufacturedItems manufacturedItem =
        ManufacturedItems('xyz', 8, 4, 'manufactured');
    test('Item tax', () {
      expect(manufacturedItem.calculateTax(), equals(1.0));
    });
    test('Item total price', () {
      expect(manufacturedItem.calculateFinalPrice(1.0), equals(36.72));
    });
  });

  group('Testing for imported item with surcharge 5', () {
    ImportedItems importedItem =
        ImportedItems('ABC imported', 10, 10, 'imported');
    test('Item Import duty', () {
      expect(importedItem.calculateTax(), equals(1.0));
    });
    test('Item final price', () {
      expect(importedItem.calculateTotalPriceOfImportedItem(11), equals(160.0));
    });
  });
  group('Testing for imported item with surcharge 10', () {
    ImportedItems importedItem =
        ImportedItems('XYZ imported', 110, 3, 'imported');
    test('Item import duty', () {
      expect(importedItem.calculateTax(), equals(11.0));
    });
    test('Item final price', () {
      expect(
          importedItem.calculateTotalPriceOfImportedItem(121), equals(393.0));
    });
  });
  group('Testing for imported item with surcharge of 5% of total cost', () {
    ImportedItems importedItem =
        ImportedItems('PQR imported', 200, 5, 'imported');
    test('Item import duty', () {
      expect(importedItem.calculateTax(), equals(20));
    });
    test('Item final price', () {
      expect(importedItem.calculateTotalPriceOfImportedItem(220), equals(1155));
    });
  });

  group('Testing the exceptions', () {
    test('Check if input contains all arguments', () {
      expect(() => ValidationUtils.checkIfInputContainsAllArguments(7),
          throwsA(isA<AllArgumentsNotProvidedException>()));
    });
    test('Check if item price is negative', () {
      expect(() => ValidationUtils.checkIfItemPriceNegativeOrZero(-5),
          throwsA(isA<ItemPriceNegativeOrZeroException>()));
    });
    test('Check if item price is zero', () {
      expect(() => ValidationUtils.checkIfItemPriceNegativeOrZero(0),
          throwsA(isA<ItemPriceNegativeOrZeroException>()));
    });
    test('Check if item quantity is negative', () {
      expect(() => ValidationUtils.checkIfItemQuantityNegativeOrZero(-2),
          throwsA(isA<ItemQuantityNegativeOrZeroException>()));
    });
    test('Check if item quantity is zero', () {
      expect(() => ValidationUtils.checkIfItemQuantityNegativeOrZero(0),
          throwsA(isA<ItemQuantityNegativeOrZeroException>()));
    });
  });
}
