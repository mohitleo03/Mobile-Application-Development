class product {
  late String productName;
  late String productDesc;
  late double produtPrice;
  late int productQty;
  product() {}
  product.takeInput(
      {required String this.productName,
      required String this.productDesc,
      required double this.produtPrice,
      required int this.productQty});
}
