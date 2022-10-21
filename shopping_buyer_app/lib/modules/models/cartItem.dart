class CartItem {
  late String productId;
  late int quantity;
  late double price;
  late String url;
  late String name;

  CartItem(
    this.productId,
    this.quantity,
    this.price,
    this.url,
    this.name,
  );

  Map<String, dynamic> toJSON() {
    return {
      "productId": productId,
      "quantity": quantity,
      "price": price,
      "url": url,
      "name": name
    };
  }
}
