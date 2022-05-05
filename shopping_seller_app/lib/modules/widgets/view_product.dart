import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/repository/product_repo.dart';

import '../models/product.dart';

class ViewProduct extends StatelessWidget {
  ProductRepository repo = ProductRepository();

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
        child: StreamBuilder(
            stream: repo.readRealTime(),
            builder: ((BuildContext ctx, AsyncSnapshot snapshot){
              ConnectionState state = snapshot.connectionState;
              if(state == ConnectionState.waiting){
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
              }
              else {
                return ListView.builder(
                  itemBuilder: (BuildContext ctx, int index) {
                    return ListTile(
                        leading: Container(
                            width: deviceSize.width / 5.2,
                            child: Image.network(snapshot.data![index].url)),
                        title: Text(snapshot.data![index].name),
                        // subtitle: Text(snapshot.data![index].desc),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data![index].desc),
                            Text("Quantity : ${snapshot.data![index].qty}")
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize
                              .min, //without this it takes main axis size as size which overflow and gives error
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ));
                  },
                  itemCount: snapshot.data!.length,
                );
              }
            }
            )
        )
    );
  }

  // Widget build(BuildContext context) {
  //   Size deviceSize = MediaQuery.of(context).size;
  //   ProductRepository repo = ProductRepository();
  //   return Container(
  //     child: FutureBuilder(
  //       future: repo.read(), //Firebase read operation, which give future
  //       builder: (BuildContext ctx, AsyncSnapshot<List<Product>> snapshot) {
  //         ConnectionState state = snapshot.connectionState;
  //         if (state == ConnectionState.waiting) {
  //           //loading
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         } else if (snapshot.hasError) {
  //           print("Error is ...");
  //           print(snapshot.error);
  //           return Center(
  //             child: Text('Some error in retrieving products'),
  //           );
  //         } else {
  //           //it has data
  //           return ListView.builder(
  //             itemBuilder: (BuildContext ctx, int index) {
  //               return ListTile(
  //                   leading: Container(
  //                       width: deviceSize.width / 5.2,
  //                       child: Image.network(snapshot.data![index].url)),
  //                   title: Text(snapshot.data![index].name),
  //                   // subtitle: Text(snapshot.data![index].desc),
  //                   subtitle: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(snapshot.data![index].desc),
  //                       Text("Quantity : ${snapshot.data![index].qty}")
  //                     ],
  //                   ),
  //                   trailing: Row(
  //                     mainAxisSize: MainAxisSize.min,//without this it takes main axis size as size which overflow and gives error
  //                     children: [
  //                       IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
  //                       IconButton(
  //                           onPressed: () {},
  //                           icon: Icon(
  //                             Icons.delete,
  //                             color: Colors.red,
  //                           ))
  //                     ],
  //                   )
  //                   );
  //             },
  //             itemCount: snapshot.data!.length,
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
}
