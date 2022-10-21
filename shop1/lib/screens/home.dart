import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class home extends StatelessWidget {
  _getCard({String path = "./images/Grocery.png", String text = "Popular Items"}) {
    //   if (path[0] == 'h') {
    //   NetworkImage image = NetworkImage(path);
    // } else {
    //   AssetImage image = AssetImage(path);
    // }
      if (path[0] == 'h') {
        return Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Image(image: NetworkImage(path), height: 105, width: 130),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,5,0,5),
                child: Text(text.toUpperCase()),
              )
            ],
          ),
        );
      }
      else{
        return Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Image(image: AssetImage(path), height: 115, width: 170),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,5,0,5),
                child: Text(text.toUpperCase()),
              )
            ],
          ),
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    String path = "./images/Grocery.png";
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 30,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 5)
        ],
        backgroundColor: Color.fromARGB(255, 57, 8, 66),
        title: Center(child: Text("Categories")),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 18, 5, 18),
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _getCard(
                      path: "https://thumbs.dreamstime.com/b/lots-groceries-17001094.jpg",
                      text: "Popular Items"
                      ),
                    _getCard(
                      path: "https://static7.depositphotos.com/1156423/675/i/600/depositphotos_6754766-stock-photo-paper-bag-with-groceries.jpg",
                      text: "Fruits"
                      ),
                    _getCard(
                      path: "https://st.depositphotos.com/1063437/2600/i/600/depositphotos_26003555-stock-photo-assorted-grocery-products-isolated-on.jpg",
                      text: "Vegetables"
                      ),
                    _getCard(
                      path: "https://thumbs.dreamstime.com/b/organic-groceries-concept-pile-fresh-fruits-vegetables-miniature-shopping-cart-studio-shot-isolated-white-91653422.jpg",
                      text: "Groceries"
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    _getCard(
                      path: "https://img.freepik.com/free-photo/shopping-bag-full-fresh-fruits-vegetables-with-assorted-ingredients_8087-2232.jpg",
                      text: "Food & Drinks"
                      ),
                    _getCard(
                      path: "https://previews.123rf.com/images/belchonock/belchonock1909/belchonock190922769/130625992-shopping-basket-and-grocery-products-on-white-background.jpg",
                      text: "food Items"
                      ),
                    _getCard(
                      path: "https://previews.123rf.com/images/monticello/monticello1406/monticello140600078/28992149-green-shopping-bag-with-groceries-isolated-on-white-background.jpg",
                      text: "Special Collect"
                      ),
                    _getCard(
                      path: "https://previews.123rf.com/images/monticello/monticello1307/monticello130700019/20781678-gr%C3%BCne-einkaufstasche-mit-lebensmittelgesch%C3%A4ft-produkte-auf-wei%C3%9Fem-hintergrund.jpg",
                      text: "others"
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
