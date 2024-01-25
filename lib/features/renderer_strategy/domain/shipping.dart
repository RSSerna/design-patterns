/// Shipping address
///
class Address {
  late String contactName;
  late String addressLine1;
  late String addressLine2;
  late String city;
  late String region;
  late String country;
  late String postalCode;
}

/// Shippers you can choose from
///
enum ShippingOptions { ups, fedex, purulator, amazon }

/// Order entity
///
class Order {
  late ShippingOptions _shippingMethod;
  late Address _destination;
  late Address _origin;

  Order(ShippingOptions shippingMethod, Address destination, Address origin) {
    _shippingMethod = shippingMethod;
    _destination = destination;
    _origin = origin;
  }

  ShippingOptions get shippingMethod {
    return _shippingMethod;
  }

  Address get origin {
    return _origin;
  }

  Address get destination {
    return _destination;
  }
}

/// Shipping cost calculation service
///
abstract class ShippingCostCalculatorService {
  double calculateShippingCost(Order order);

  ///////////////////////////////////////////////////////////////
  /// Terrible coding practice
  ///
  /// Should be handled through a strategy pattern
  // double calculateForPurulator(Order order) {
  //   return 5.00;
  // }

  // double calculateForUPS(Order order) {
  //   return 7.25;
  // }

  // double calculateForFedEx(Order order) {
  //   return 9.25;
  // }
}

class PurpulatorShippingCost extends ShippingCostCalculatorService{
  @override
  double calculateShippingCost(Order order) {
    return 5;
  }
}
class UPSShippingCost extends ShippingCostCalculatorService{
  @override
  double calculateShippingCost(Order order) {
    return 7.25;
  }
}
class FedExShippingCost extends ShippingCostCalculatorService{
  @override
  double calculateShippingCost(Order order) {
    return 9.25;
  }
}
class AmazonShippingCost extends ShippingCostCalculatorService{
  @override
  double calculateShippingCost(Order order) {
    return 3.25;
  }
}

