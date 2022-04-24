import 'package:flutter/material.dart';
import 'package:shopping_seller_app/modules/widgets/add_product.dart';
import 'package:shopping_seller_app/modules/widgets/view_product.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> _loadAllPages() {
    return [
      {'page': AddPrduct(), 'title': 'Add Product', 'icon': Icons.add},
      {'page': ViewProduct(), 'title': 'View Product', 'icon': Icons.list}
    ];
  }

  int currentPage = 0;
  late List<Map<String, dynamic>> _allPages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allPages = _loadAllPages();
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String userid = arguments['userid'];
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: UserAccountsDrawerHeader(
          margin: EdgeInsets.zero,
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
            'https://cdn5.vectorstock.com/i/1000x1000/51/99/icon-of-user-avatar-for-web-site-or-mobile-app-vector-3125199.jpg'),),
          accountName: Text(userid.split("@")[0],style: TextStyle(fontSize: 25)),
          accountEmail: Text(userid,style: TextStyle(fontSize: 20)))
      ),
      body: SafeArea(child: _allPages[currentPage]['page']),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (int currentPageIndex) {
            currentPage = currentPageIndex;
            setState(() {});
          },
          items: _allPages
              .map((element) => BottomNavigationBarItem(
                  icon: Icon(element['icon']),
                  label: _allPages[0]['page'].toString()))
              .toList()
          // [
          // BottomNavigationBarItem(icon: Icon(Icons.add),label: _allPages[0]['page'].toString()),
          // BottomNavigationBarItem(icon: Icon(Icons.list),label: _allPages[1]['page'].toString()),
          // ]
          ),
    );
  }
}
