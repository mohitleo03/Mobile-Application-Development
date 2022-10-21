import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/modules/repository/product_repo.dart';

import '../models/product.dart';

class searchProduct extends StatefulWidget {
  const searchProduct({Key? key}) : super(key: key);

  @override
  State<searchProduct> createState() => _searchProduct();
}

class _searchProduct extends State<searchProduct> {
  ProductRepository repo = ProductRepository();
  late Product product;
  TextEditingController editingController = TextEditingController();

  List<Product> ls = [];
  List<Product> finalproduct = [];

  @override
  void initState() {
    finalproduct.addAll(ls);
    super.initState();
  }

  void filterSearchResults() {
    String query = editingController.text;
    List<Product> dummySearchList = ls;
    print(ls.toString() +
        " ########################################### " +
        finalproduct.toString());
    //dummySearchList.addAll(ls);
    if (query.isNotEmpty) {
      List<Product> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.contains(query)) {
          print("if #" + item.toString());
          dummyListData.add(item);
        }
      });
      setState(() {
        finalproduct.clear();
        finalproduct = (dummyListData);
      });
      return;
    } else {
      setState(() {
        finalproduct.clear();
        finalproduct = (ls);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('search your product !!'),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: 60,
              child: TextField(
                controller: editingController,
                decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: (filterSearchResults),
                  ),
                ),
              ),
            ),

            Container(
                height: deviceSize.height - 60,
                child: StreamBuilder(
                    stream: repo.readRealTime(),
                    builder: ((BuildContext ctx,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      ConnectionState state = snapshot.connectionState;
                      if (state == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        print("Error is ...");
                        print(snapshot.error);
                        return Center(
                          child: Text('Some error in retrieving products'),
                        );
                      } else {
                        return ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext ctx, int index) {
                            var doc = snapshot.data!.docs[index].data();
                            product = Product.fromMap(
                                doc, snapshot.data!.docs[index].id);
                            ls.add(product);
                            return ListTile(
                                leading: Container(
                                    width: deviceSize.width / 5.2,
                                    child: Image.network(product.url)),
                                title: Text(product.name),
                                // subtitle: Text(snapshot.data![index].desc),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product.desc),
                                    Text("Quantity : ${product.qty}")
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize
                                      .min, //without this it takes main axis size as size which overflow and gives error
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          //update the product
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          //delete the product
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                ));
                          },
                          itemCount: snapshot.data!.docs.length,
                        );
                      }
                    }))),
          ],
        ),
        // child:Text("Your widget")
      )),
    );
  }
}
