import '../../config/constants/AppConstants.dart';
import '../models/drawer_option.dart';

class DrawerOptionList{
    List<DrawerOption> drawer_options = [
    DrawerOption(
        name: AppBarTitle.HOME, isActive: false, route: RouteConstants.DASHBOARD),
    DrawerOption(
        name: AppBarTitle.MY_CART, isActive: false, route: RouteConstants.MY_CART),
    DrawerOption(
        name: AppBarTitle.MY_ORDERS,
        isActive: false,
        route: RouteConstants.MY_ORDERS),
  ];
}