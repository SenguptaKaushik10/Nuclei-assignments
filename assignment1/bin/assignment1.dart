import 'dart:io';
import 'package:assignment1/exceptions/item_price_negative_or_zero_exception.dart';
import 'package:assignment1/exceptions/item_quantity_negative_or_zero_exception.dart';
import 'package:assignment1/utils/validation_utils.dart';
import 'package:assignment1/exceptions/all_arguments_not_provided_exception.dart';
import 'package:assignment1/models/raw_items.dart';
import 'package:assignment1/models/manufactured_items.dart';
import 'package:assignment1/models/imported_items.dart';
import 'package:assignment1/strings/strings_for_input.dart';
import 'package:assignment1/strings/strings_for_exceptions.dart';
import 'package:assignment1/models/print_class_for_raw_and_manufactured_items.dart';
import 'package:assignment1/models/print_class_for_imported_items.dart';

void main(List<String> arguments) {
  const ITEM_TYPE_RAW = 'raw';
  const ITEM_TYPE_MANUFACTURED = 'manufactured';
  const ITEM_TYPE_IMPORTED = 'imported';
  const YES_CHARACTER = 'y';
  const NO_CHARACTER = 'n';
  const PRICE_STRING = '-price';
  const QUANTITY_STRING = '-quantity';
  const TYPE_STRING = '-type';
  String firstItemName = arguments[1];
  double? firstItemPrice, firstItemQuantity;
  String? firstItemType;
  //exception handling of first CLI input
  try {
    ValidationUtils.checkIfInputContainsAllArguments(arguments.length);
    for (int i = 2; i < 7; i = i + 2) {
      if (arguments[i] == PRICE_STRING) {
        firstItemPrice = double.parse(arguments[i + 1]);
        ValidationUtils.checkIfItemPriceNegativeOrZero(firstItemPrice);
      } else if (arguments[i] == QUANTITY_STRING) {
        firstItemQuantity = double.parse(arguments[i + 1]);
        ValidationUtils.checkIfItemQuantityNegativeOrZero(firstItemQuantity);
      } else if (arguments[i] == TYPE_STRING) {
        firstItemType = arguments[i + 1];
      }
    }
  } on AllArgumentsNotProvidedException {
    print(StringsForException
        .ALL_ARGUMENTS_NOT_PRESENT_OR_NOT_PROVIDED_IN_CORRECT_ORDER_EXCEPTION_STRING);
    return;
  } on ItemPriceNegativeOrZeroException {
    print(StringsForException
        .ITEM_PRICE_CANNOT_BE_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
    return;
  } on ItemQuantityNegativeOrZeroException {
    print(StringsForException
        .ITEM_QUANTITY_CANNOT_BE_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
    return;
  } on FormatException {
    print(StringsForException.FORMAT_EXCEPTION_STRING);
    return;
  }
  switch (firstItemType!.toLowerCase()) {
    case ITEM_TYPE_RAW:
      RawItems rawItem = RawItems(
          firstItemName, firstItemPrice, firstItemQuantity, firstItemType);
      double tax = rawItem.calculateTax();
      double finalPrice = rawItem.calculateFinalPrice(tax);
      //calls the print function
      PrintRawAndManufacturedItems.printFunction(
          firstItemName, firstItemPrice, tax, finalPrice, firstItemQuantity);
      break;
    case ITEM_TYPE_MANUFACTURED:
      ManufacturedItems manufacturedItem = ManufacturedItems(
          firstItemName, firstItemPrice, firstItemQuantity, firstItemType);
      double tax = manufacturedItem.calculateTax();
      double finalPrice = manufacturedItem.calculateFinalPrice(tax);
      //calls the print function here
      PrintRawAndManufacturedItems.printFunction(
          firstItemName, firstItemPrice, tax, finalPrice, firstItemQuantity);
      break;
    case ITEM_TYPE_IMPORTED:
      ImportedItems importedItem = ImportedItems(
          firstItemName, firstItemPrice, firstItemQuantity, firstItemType);
      // calculate import duty of imported items
      double importDuty = importedItem.calculateTax();
      // final price here implies cost per unit after applying import duty
      double finalPrice = importedItem.calculateFinalPrice(importDuty);
      // total price of imported item implies cost per uni after applying surcharge
      double totalPriceOfImportedItem =
          importedItem.calculateTotalPriceOfImportedItem(finalPrice);
      //call the print function here
      PrintImportedItems.printFunction(firstItemName, firstItemPrice,
          importDuty, totalPriceOfImportedItem, firstItemQuantity, finalPrice);
      break;
    default:
      print(StringsForException.PLEASE_ENTER_VALID_INPUT_TYPE_STRING);
      break;
  }
  InputLoop:
  while (true) {
    //for input from second time
    String? newName, newType;
    double? newPrice, newQuantity;
    print(StringsForInput.INPUT_MENU_HEADER);
    String checkChar = stdin.readLineSync()!;
    switch (checkChar.toLowerCase()) {
      case YES_CHARACTER:
        try {
          print(StringsForInput.INPUT_NEW_ITEM_NAME);
          newName = stdin.readLineSync();
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break;
        }
        try {
          print(StringsForInput.INPUT_NEW_ITEM_PRICE);
          newPrice = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfItemPriceNegativeOrZero(newPrice);
        } on ItemPriceNegativeOrZeroException {
          print(StringsForException
              .ITEM_PRICE_CANNOT_BE_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
          break;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break;
        }
        try {
          print(StringsForInput.INPUT_NEW_ITEM_QUANTITY);
          newQuantity = double.parse(stdin.readLineSync()!);
          ValidationUtils.checkIfItemQuantityNegativeOrZero(newQuantity);
        } on ItemQuantityNegativeOrZeroException {
          print(StringsForException
              .ITEM_QUANTITY_CANNOT_BE_NEGATIVE_OR_ZERO_EXCEPTION_STRING);
          break;
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break;
        }
        try {
          print(StringsForInput.INPUT_NEW_ITEM_TYPE);
          newType = stdin.readLineSync();
        } on FormatException {
          print(StringsForException.FORMAT_EXCEPTION_STRING);
          break;
        }
        InnerSwitch:
        switch (newType!.toLowerCase()) {
          case ITEM_TYPE_RAW:
            RawItems rawItem =
                RawItems(newName, newPrice, newQuantity, newType);
            double tax = rawItem.calculateTax();
            double finalPrice = rawItem.calculateFinalPrice(tax);
            PrintRawAndManufacturedItems.printFunction(
                newName, newPrice, tax, finalPrice, newQuantity);
            break InnerSwitch;
          case ITEM_TYPE_MANUFACTURED:
            ManufacturedItems manufacturedItem =
                ManufacturedItems(newName, newPrice, newQuantity, newType);
            double tax = manufacturedItem.calculateTax();
            double finalPrice = manufacturedItem.calculateFinalPrice(tax);
            PrintRawAndManufacturedItems.printFunction(
                newName, newPrice, tax, finalPrice, newQuantity);
            break InnerSwitch;
          case ITEM_TYPE_IMPORTED:
            ImportedItems importedItem =
                ImportedItems(newName, newPrice, newQuantity, newType);
            // calculate import duty of imported items
            double importDuty = importedItem.calculateTax();
            // final price here implies cost per unit after applying import duty
            double finalPrice = importedItem.calculateFinalPrice(importDuty);
            // total price of imported item implies cost per uni after applying surcharge
            double totalPriceOfImportedItem =
                importedItem.calculateTotalPriceOfImportedItem(finalPrice);
            PrintImportedItems.printFunction(newName, newPrice, importDuty,
                totalPriceOfImportedItem, newQuantity, finalPrice);
            break InnerSwitch;
          default:
            print(StringsForException.PLEASE_ENTER_VALID_INPUT_TYPE_STRING);
            break InnerSwitch;
        }
        break;
      case NO_CHARACTER:
        print(StringsForInput.INPUT_MENU_EXIT_STRING);
        break InputLoop;
      default:
        print(StringsForInput.INPUT_DEFAULT_Y_N_STRING);
        break;
    }
  }
}
