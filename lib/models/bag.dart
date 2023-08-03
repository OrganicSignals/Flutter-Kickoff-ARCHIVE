enum Look {
  simple,
  trendy,
  vintage,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Bag {
  const Bag({
    required this.bagName,
    required this.id,
    required this.categories,
    required this.imageUrl,
    required this.material,
    required this.description,
    required this.look,
    required this.price,
    required this.affordability,
    required this.isCottonFabric,
  });

  final String id;
  final List<String> categories;
  final String bagName;
  final String imageUrl;
  final List<String> material;
  final List<String> description;
  // ignore: prefer_typing_uninitialized_variables
  final double price;
  final look;
  final Affordability affordability;
  final bool isCottonFabric;
}
