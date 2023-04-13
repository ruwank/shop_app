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

  factory Product.fromJson(Map<String, dynamic> prodData) {
    return Product(
      id: prodData['id'],
      sku: prodData['SKU'],
      name: prodData['name'],
      brandName: prodData['brandName'],
      mainImage: prodData['mainImage'],
      amount: double.parse(prodData['price']['amount']),
      currency: prodData['price']['currency'],
      sizes: prodData['sizes'].cast<String>(),
      stockStatus: prodData['stockStatus'],
      colour: prodData['colour'],
      description: prodData['description'],
    );
  }
}
