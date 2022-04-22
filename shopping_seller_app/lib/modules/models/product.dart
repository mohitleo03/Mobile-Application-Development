class product {
  late String productName;
  late String productDesc;
  late double produtPrice;
  late int productQty;
  product() {}
  product.takeInput(
      {required this.productName,
      required this.productDesc,
      required this.produtPrice,
      required this.productQty});
  @override
  String toString() {
    return "Product name is $productName , Product Description is $productDesc , Product Price is $produtPrice , Product Quantity is $productQty";
  }
}
