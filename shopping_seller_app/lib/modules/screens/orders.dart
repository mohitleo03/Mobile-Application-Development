// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shopping_seller_app/modules/Services/services.dart';
// import 'package:shopping_seller_app/modules/models/product.dart';
// import 'package:shopping_seller_app/modules/repository/orders_repo.dart';
// import 'package:shopping_seller_app/modules/repository/product_repo.dart';
// import 'package:shopping_seller_app/modules/widgets/drawer.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../config/constants/AppConstants.dart';
// import '../Services/drawer_options_list.dart';
// import '../models/drawer_option.dart';
// import '../models/orders.dart';

// class Orders extends StatefulWidget {
//   @override
//   State<Orders> createState() => _OrdersState();
// }

// class _OrdersState extends State<Orders> {
//   OrdersRepo ordersRepo = OrdersRepo.getInstance();
//   ProductRepository productRepo = ProductRepository();
//   DrawerOptionList list = DrawerOptionList();
//   Services service = Services();

//   String dropdownValue = "ALL";
//   List<Order?> _getOrdersList(List<Order?> list) {
//     list = list.map((order) {
//       if (order!.order_status == dropdownValue) {
//         return order;
//       }
//     }).toList();
//     return list;
//   }

//   List<DropdownMenuItem<String>> item_list = [
//     DropdownMenuItem(
//         child: Text(OrderStatus.PENDING), value: OrderStatus.PENDING),
//     DropdownMenuItem(
//         child: Text(OrderStatus.DELIVERED), value: OrderStatus.DELIVERED),
//     DropdownMenuItem(
//         child: Text(OrderStatus.CANCELLED), value: OrderStatus.CANCELLED),
//     DropdownMenuItem(child: Text(OrderStatus.ALL), value: OrderStatus.ALL)
//   ];

//   List<Widget> _getProducts(Order order) {
//     List<Widget> products = order.products_list
//         .map((product) => Container(
//               child: Column(
//                 children: [
//                   FutureBuilder(
//                       future:
//                           productRepo.getSingleProduct(product['product_id']),
//                       builder: (BuildContext context, AsyncSnapshot snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return Center(child: CircularProgressIndicator());
//                         } else if (snapshot.hasError) {
//                           return Center(
//                             child: Text(Messages.ERROR),
//                           );
//                         } else {
//                           var temp = snapshot.data["name"];
//                           print("Run time type is ${temp}}");

//                           return Container(
//                             child: Row(
//                               children: [
//                                 Column(
//                                   children: [Text("Got Data")],
//                                 )
//                               ],
//                             ),
//                           );
//                         }
//                       })
//                 ],
//               ),
//             ))
//         .toList();
//     return products;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.of(context).size;
//     List<DrawerOption> drawer_options_list = list.drawer_options;
//     drawer_options_list = drawer_options_list.map((drawerOption) {
//       if (drawerOption.name == AppBarTitle.ORDERS) {
//         drawerOption.isActive = true;
//         return drawerOption;
//       } else {
//         return drawerOption;
//       }
//     }).toList();
//     Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
//     String userid = arguments['userid'];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppBarTitle.ORDERS),
//       ),
//       drawer: Drawer(child: myDrawer(userid, drawer_options_list)),
//       body: Center(
//         child: Column(children: [
//           DropdownButton(
//               items: item_list,
//               onChanged: (dynamic newValue) {
//                 setState(() {
//                   dropdownValue = newValue;
//                 });
//               },
//               value: dropdownValue),
//           FutureBuilder(
//             future: ordersRepo.getOrders(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Text(Messages.ERROR);
//               } else {
//                 List<Order> list = service.convertOrders(snapshot);
//                 _getOrdersList(list);
//                 return Expanded(
//                   child: ListView.builder(
//                       itemCount: list.length,
//                       itemBuilder: (context, index) {
//                         if (list.isNotEmpty) {
//                           return Container(
//                             height: deviceSize.height - 100,
//                             child: ListView.builder(
//                                 itemCount: list.length,
//                                 itemBuilder: ((context, index) {
//                                   return Card(
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           child: Text(list[index].order_status),
//                                         ),
//                                         Divider(height: 1),
//                                         Container(
//                                           child: Column(
//                                             children: _getProducts(list[index]),
//                                           ),
//                                         ),
//                                         Divider(height: 1),
//                                         Container(
//                                           child: Text(
//                                               "Amount : ${list[index].price}"),
//                                         )
//                                       ],
//                                     ),
//                                   );
//                                 })),
//                           );
//                         } else {
//                           return SizedBox.shrink();
//                         }
//                       }),
//                 );
//               }
//             },
//           )
//         ]),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_seller_app/config/constants/AppConstants.dart';
import 'package:shopping_seller_app/modules/Services/drawer_options_list.dart';
import 'package:shopping_seller_app/modules/models/drawer_option.dart';
import 'package:shopping_seller_app/modules/widgets/drawer.dart';
import '../Services//services.dart';
import '../models/orders.dart';
import '../repository/orders_repo.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  OrdersRepo ordersRepo = OrdersRepo.getInstance();
  Services services = Services();
  //List<Product> _list_products = [];

  // _getList() async
  // {
  //   Future<List<Product>> future_list =ProductRepository().read();
  //   List<Product> list_products =  await future_list;
  //   _list_products=list_products;
  // }
  DrawerOptionList list = DrawerOptionList();
  String dropdownValue = "ALL";
  List<String> item_list = ["ALL", "PENDING", "DELIVERED", "CANCELLED"];
  String selectedValue = "ALL";

  // String _getnamebyid(String id)
  // {
  //   int index = _list_products.indexWhere((element) => element.id==id);
  //   return _list_products[index].name;
  // }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    List<DrawerOption> drawer_options_list = list.drawer_options;
    drawer_options_list = drawer_options_list.map((drawerOption) {
      if (drawerOption.name == AppBarTitle.ORDERS) {
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
        elevation: 0,
        title: Text(
          "Orders List",
        ),
      ),
      drawer: Drawer(child: myDrawer(userid, drawer_options_list)),
      body: SafeArea(
          child: Column(children: [
        DropdownButtonFormField2(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            isExpanded: true,
            value: selectedValue,
            hint: const Text(
              '  Select Status',
              style: TextStyle(fontSize: 14),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 60,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            items: item_list
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              selectedValue = value.toString();
              setState(() {
                
              });
            }),
        // DropdownButton(
        //     items: item_list,
        //     onChanged: (dynamic newValue) {
        //       setState(() {
        //         dropdownValue = newValue;
        //       });
        //     },
        //     value: dropdownValue),
        FutureBuilder(
          future: ordersRepo.getOrders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Some error has occured");
            } else {
              List<Order> list = services.convertOrders(snapshot.data);
              //_getList();

              return Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      if (list[index].order_status == dropdownValue) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(8, 20, 8, 10),
                          child: Container(
                              alignment: Alignment.center,
                              height: 150,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: Offset(5, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text("Order ID : ${list[index].id}",
                                        style: GoogleFonts.lato(
                                            fontSize: 23,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Expanded(
                                      child: ListView.builder(
                                          itemCount:
                                              list[index].products_list.length,
                                          itemBuilder: ((context, i) {
                                            return ListTile(
                                              title: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                    "Product ID : " +
                                                        "${list[index].products_list[i]['product_id']}",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 18,
                                                        color: Colors.black)),
                                              ),
                                            );
                                          }))),
                                  Text("Price : " + "${list[index].price}",
                                      style: GoogleFonts.lato(
                                          fontSize: 17, color: Colors.black)),
                                  Text(
                                      "Status : " +
                                          "${list[index].order_status}",
                                      style: GoogleFonts.lato(
                                          fontSize: 17, color: Colors.black)),
                                  Text(
                                      "Zone : " +
                                          "${list[index].delivery_zone}",
                                      style: GoogleFonts.lato(
                                          fontSize: 17, color: Colors.black)),
                                ],
                              )),
                        );
                      } else if (dropdownValue == "ALL") {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
                          child: Container(
                              alignment: Alignment.center,
                              height: 150,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: Offset(2, 4))
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text("Order ID : ${list[index].id}",
                                        style: GoogleFonts.lato(
                                            fontSize: 23,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Expanded(
                                      child: ListView.builder(
                                          itemCount:
                                              list[index].products_list.length,
                                          itemBuilder: ((context, i) {
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(left: 30),
                                              child: Text(
                                                  "Product ID :" +
                                                      "${list[index].products_list[i]['product_id']}",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 18,
                                                      color: Colors.black)),
                                            );
                                          }))),
                                  Text("Price : " + "${list[index].price}",
                                      style: GoogleFonts.lato(
                                          fontSize: 17, color: Colors.black)),
                                  Text(
                                      "Status : " +
                                          "${list[index].order_status}",
                                      style: GoogleFonts.lato(
                                          fontSize: 17, color: Colors.black)),
                                  Text(
                                      "Zone : " +
                                          "${list[index].delivery_zone}",
                                      style: GoogleFonts.lato(
                                          fontSize: 17, color: Colors.black))
                                ],
                              )),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
              );
            }
          },
        )
      ])),
      // body: SafeArea(
      //     child: FutureBuilder(
      //   future: ordersRepo.getOrders(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Text("Some error has occured");
      //     } else {
      //       List<Order> list = OrderServies().convertOrders(snapshot.data);

      //       return ListView.builder(
      //           itemCount: list.length,
      //           itemBuilder: (context, index) {
      //             // return ListTile(

      //             //   leading: Text("Order ID : ${list[index].id}"+"Product_id"+"${list[index].products_list[0]['product_id']}"+"  "+"${list[index].price}"+"  "+"${list[index].order_status}"+"     "+"${list[index].delivery_zone}", style: TextStyle(color: Colors.black, fontSize: 12),),
      //             //   //leading: Text("${list[index].date}"),

      //             // );
      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                   alignment: Alignment.center,

      //                   height: 120,
      //                   width: 60,
      //                   decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.all(Radius.circular(20)) ),
      //                   child: Column(

      //                     children: [

      //                       if(list[index].order_status=="")
      //                       Text(
      //                         "Order ID : ${list[index].id}",
      //                         style:
      //                             TextStyle(color: Colors.black, fontSize: 20 ,),
      //                       ),

      //                       Text("Product_id : "+"${list[index].products_list[0]['product_id']}" , style: TextStyle(fontSize: 18),),
      //                       Text("Price : " + "${list[index].price}",style: TextStyle(fontSize: 18)),
      //                       Text("Status : " + "${list[index].order_status}",style: TextStyle(fontSize: 18)),
      //                       Text("Zone : " + "${list[index].delivery_zone}",style: TextStyle(fontSize: 18))
      //                     ],
      //                   )),
      //             );
      //           });
      //     }
      //   },
      // )),
    );
  }
}
