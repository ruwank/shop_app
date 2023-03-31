class Product {
  final String id;
  final String sku;
  final String name;
  final String brandName;
  final String mainImage;
  final double amount;
  final String currency;
  final List<String> sizes;
  final String stockStatus;
  final String colour;
  final String description;

  Product({
    required this.id,
    required this.sku,
    required this.name,
    required this.brandName,
    required this.mainImage,
    required this.amount,
    required this.currency,
    required this.sizes,
    required this.stockStatus,
    required this.colour,
    required this.description,
  });
}

class Price {
  final double amount;
  final String currency;

  Price({
    required this.amount,
    required this.currency,
  });
}
