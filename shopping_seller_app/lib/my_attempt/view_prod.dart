import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/models/product.dart';
import 'package:shopping_seller_app/modules/repository/product_repo.dart';

class view_products extends StatefulWidget {
  const view_products({Key? key}) : super(key: key);

  @override
  State<view_products> createState() => _view_productsState();
}

class _view_productsState extends State<view_products> {
  List<Product> products = [];
  List<Product> deleting_products = [];
  late Size deviceSize;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductRepository opr = ProductRepository();
    // opr.read(getProducts, getError);
    Future future = opr.readByAwait();
    future.then((Products) {
      products = Products;
      print(products);
      setState(() {});
    }).catchError((err) {
      products = [];
      print(err);
    });
  }

  getProducts(List<Product> products) {
    print("object");
    this.products = products;
    print(this.products);
    setState(() {});
  }

  getError(dynamic err) {
    print("Error is $err");
  }

  List<Widget> _printProducts() {
    // return ListView.builder(
    //   itemBuilder: (BuildContext ctx, int index) {
    //     return ListTile(
    //       // leading: Image.network(products[index].url),
    //       title: Text(products[index].name),
    //       subtitle: Column(
    //         children: [
    //           Text(products[index].desc),
    //           Text("Product Quantity : ${products[index].qty}")
    //         ],
    //       ),
    //     trailing: Row(
    //       children: [
    //         IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
    //         IconButton(onPressed: (){}, icon: Icon(Icons.delete))
    //       ],
    //     ),
    //     );
    //   },
    //   itemCount: products.length,
    // );
    List<Widget> listOfProducts = products.map((Product product) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black)),
              width: deviceSize.width / 4,
              child: Image.network(product.url),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: deviceSize.width / 19),
                  ),
                  Text(product.desc),
                  Text("Quantity : ${product.qty.toString()}")
                ],
              ),
            ),
            Container(
              width: 10 + deviceSize.width / 4,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                ],
              ),
            )
          ]);
    }).toList();
    return listOfProducts;
  }

  Center _showLoading() {
    // //Simple loading till we get songs
    // Future.delayed(Duration(seconds: 3), () {
    //   //if still loading till 3 sec
    //   loading =
    //       false; //switch loading bool value to false & re-render which will show Network error
    //   setState(() {});
    // });
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
          children: products.isEmpty ? [_showLoading()] : _printProducts(),
        ),
      
    );
    // return Container(
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           Column(
    //             children: [
    //               Text("Todal Products : ${products.length}"),
    //               Text("products to be deleted : 0")
    //               ],
    //           ),
    //           Column(
    //             children: [
    //               ElevatedButton(onPressed: (){}, child: Text("Confirm Delete"))
    //             ],
    //           )
    //         ],
    //       ),
    //       ListView(children: [],)
    //     ],
    //   ),
    // );
  }
}
