import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/repository/product_repo.dart';

import '../models/product.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    ProductRepository repo = ProductRepository();
    return Container(
      child: FutureBuilder(
        future: repo.read(), //Firebase read operation, which give future
        builder: (BuildContext ctx, AsyncSnapshot<List<Product>> snapshot) {
          ConnectionState state = snapshot.connectionState;
          if (state == ConnectionState.waiting) {
            //loading
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Some error in retrieving products'),
            );
          } else {
            //it has data
            return ListView.builder(
              itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                  leading: Container(
                    width: deviceSize.width/5.2,
                    child: Image.network(snapshot.data![index].url)
                    ),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))
                    ],
                  )
                  
                // trailing: Expanded(
                //   child: Row(
                //     children: [
                //       IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                //       IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                //     ],
                //   ),
                
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }
}
