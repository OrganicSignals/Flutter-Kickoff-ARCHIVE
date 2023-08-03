class Cart {
  late final int? id;
  final String? productId;
  final String? productName;
  final double? price;
  final int? quantity;
  final String? img;

  Cart(
      {required this.id,
      required this.productId,
      required this.productName,
      required this.price,
      required this.quantity,
      required this.img});

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        price = res['price'],
        quantity = res['quantity'],
        img = res['img'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'price': price,
      'quantity': quantity,
      'img': img,
    };
  }
}
