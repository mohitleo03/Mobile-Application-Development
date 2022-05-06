import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/widgets/add_product.dart';
import 'package:shopping_seller_app/modules/widgets/view_product.dart';
import 'package:shopping_seller_app/my_attempt/add_prod.dart';
import 'package:shopping_seller_app/my_attempt/view_prod.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // List<Map<String, dynamic>> _loadAllPages() {
  //   return [
  //     {'page': AddPrduct(), 'title': 'Add Product', 'icon': Icons.add},
  //     {'page': ViewProduct(), 'title': 'View Product', 'icon': Icons.list}
  //   ];
  // }
  int flag = 0;
  List<Map<String, dynamic>> _loadAllPages() {
    print("Calling load all pages");
    return [
      {
        'page': AddPrduct(refreshChild, switchChild, flag),
        'title': 'Add Product',
        'icon': Icons.add
      },
      {'page': ViewProduct(), 'title': 'View Product', 'icon': Icons.list}
    ];
  }

  switchChild() {
    currentPage = currentPage == 0 ? 1 : 0;
    setState(() {});
  }

  refreshChild() {
    flag++;
    print("calling setstate");
    setState(() {});
  }

  int currentPage = 0;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  late List<Map<String, dynamic>> _allPages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allPages = _loadAllPages();
  }

  openBottomDialog() {
    scaffoldkey.currentState?.showBottomSheet((context) {
      return Container(
        height: 200,
        color: Colors.lightBlueAccent,
        child: Column(children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone Calls'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone Calls'),
          )
        ]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String userid = arguments['userid'];
    // String arguments = ModalRoute.of(context)!.settings.arguments as String; // we can also use any other data type but map is standard form of sending data becuas ewe just have to call the key we don't have to remember the index of data member
    // String userid = arguments;
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                openBottomDialog();
              },
              icon: Icon(Icons.abc))
        ],
      ),
      drawer: Drawer(
          child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn5.vectorstock.com/i/1000x1000/51/99/icon-of-user-avatar-for-web-site-or-mobile-app-vector-3125199.jpg'),
              ),
              accountName:
                  Text(userid.split("@")[0], style: TextStyle(fontSize: 25)),
              accountEmail: Text(userid, style: TextStyle(fontSize: 20)))),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.only(top: 10),
              child: _loadAllPages()[currentPage]['page'])),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (int currentPageIndex) {
            currentPage = currentPageIndex;
            setState(() {});
          },
          items: _allPages
              .map((element) => BottomNavigationBarItem(
                  icon: Icon(element['icon']),
                  // label: element['page'].toString()))  //how it is working on 'page' value???
                  label: element['title']))
              .toList()
          // [
          // BottomNavigationBarItem(icon: Icon(Icons.add),label: _allPages[0]['page'].toString()),
          // BottomNavigationBarItem(icon: Icon(Icons.list),label: _allPages[1]['page'].toString()),
          // ]
          ),
    );
  }
}
