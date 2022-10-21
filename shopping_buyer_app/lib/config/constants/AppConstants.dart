abstract class Constants {
  static String LOGIN_IMAGE = 'https://www.go.ooo/img/bg-img/Login.jpg';
  static String REGISTRATION_IMAGE =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO_BYSwPB6OR5dfjXGUKAfVkmI62eyRXQhBg&usqp=CAU';
  static String appId = 'A111';
  static int SUCCESS = 1;
  static int FAIL = 2;
}

abstract class RouteConstants {
  static String LOGIN = '/';
  static String REGISTER = '/register';
  static String DASHBOARD = '/dashboard';
  static String MY_ORDERS = '/my_orders';
  static String MY_CART = '/my_cart';
}

abstract class AppBarTitle {
  static String HOME = "Home";
  static String MY_ORDERS = "My Orders";
  static String MY_CART = "My Cart";
}

class Collections {
  static String PRODUCTS = 'products';
  static String USERS = 'users';
  static String CART = 'cart';
}
