import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_buyer_app/modules/screens/cartScreen.dart';
import 'package:shopping_buyer_app/modules/widgets/view_product.dart';

import '../../config/constants/AppConstants.dart';
import '../Services/drawer_options_list.dart';
import '../models/drawer_option.dart';
import '../models/product.dart';
import '../repository/product_repo.dart';
import '../widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DrawerOptionList list = DrawerOptionList();
  ProductRepository repo = ProductRepository();
  late Product product;
  TextEditingController editingController = TextEditingController();
  List<Product> ls = [];
  List<Product> finalproduct = [];

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
        finalproduct = dummyListData;
      });
      return;
    } else {
      setState(() {
        finalproduct.clear();
        finalproduct = ls;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    List<DrawerOption> drawer_options_list = list.drawer_options;
    drawer_options_list = drawer_options_list.map((drawerOption) {
      if (drawerOption.name == AppBarTitle.HOME) {
        drawerOption.isActive = true;
        return drawerOption;
      } else {
        return drawerOption;
      }
    }).toList();
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String userid = arguments['userid'];
    return Scaffold(
      appBar: AppBar(
        title: Text(AppBarTitle.HOME),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, RouteConstants.MY_CART);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => CartScreen2()));
              },
              icon: Icon(Icons.shopping_bag))
        ],
      ),
      drawer: Drawer(child: myDrawer(userid, drawer_options_list)),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 10),
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
                        ls = snapshot.data!.docs
                            .map((e) => Product.fromMap(e, e.id))
                            .toList();
                        if (editingController.text.isEmpty) {
                          finalproduct = ls;
                        }
                        return ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext ctx, int index) {
                            // product = Product.fromMap(
                            //     doc, snapshot.data!.docs[index].id);
                            // ls.add(product);

                            return ListTile(
                                leading: Container(
                                    width: deviceSize.width / 5.2,
                                    child:
                                        Image.network(finalproduct[index].url)),
                                title: Text(finalproduct[index].name),
                                // subtitle: Text(snapshot.data![index].desc),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(finalproduct[index].desc),
                                    Text(
                                        "Quantity : ${finalproduct[index].qty}")
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
                          itemCount: finalproduct.length,
                        );
                      }
                    }))),
          ],
        ),
      )),
    );
  }
}
