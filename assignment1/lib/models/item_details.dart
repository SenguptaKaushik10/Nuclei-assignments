abstract class ItemDetails {
  double calculateTax();

  double calculateFinalPrice(double tax);
}
/*
  shows how tax and final price of each item is actually calculated
  void calculateTax(ItemDetails items) {
    items.itemType;

    switch (items.itemType) {
      case 'raw':
        double tax = 0.125 * items.itemPrice!;
        double finalPrice = tax + items.itemPrice!;
        print('Item name: ${items.itemName}');
        print('Item price: ${items.itemPrice}');
        print('Sales tax liability: $tax');
        print('Final price: $finalPrice');
        break;
      case 'manufactured':
        double tax = 0.125 * items.itemPrice!;
        double finalPrice = tax + 0.02 * (items.itemPrice! + tax);
        print('Item name: ${items.itemName}');
        print('Item price: ${items.itemPrice}');
        print('Sales tax liability: $tax');
        print('Final price: $finalPrice');
        break;
      case 'imported':
        double importDuty = 0.1 * items.itemPrice!;
        double newPrice = importDuty + items.itemPrice!;
        if (newPrice <= 100.0) {
          double finalPrice = 5.0 + newPrice;
          print('Item name: ${items.itemName}');
          print('Item price: ${items.itemPrice}');
          print('Import duty: $importDuty');
          print('Final price: $finalPrice');
        } else if (newPrice > 100.0 && newPrice <= 200.0) {
          double finalPrice = 10.0 + newPrice;
          print('Item name: ${items.itemName}');
          print('Item price: ${items.itemPrice}');
          print('Import duty: $importDuty');
          print('Final price: $finalPrice');
        } else if (newPrice > 200.0) {
          double finalPrice = 0.05 * newPrice;
          print('Item name: ${items.itemName}');
          print('Item price: ${items.itemPrice}');
          print('Import duty: $importDuty');
          print('Final price: $finalPrice');
        }
        break;
      default:
        break;
    }
  }
}
*/