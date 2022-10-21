import '../../config/constants/AppConstants.dart';
import '../models/drawer_option.dart';

class DrawerOptionList{
    List<DrawerOption> drawer_options = [
    DrawerOption(
        name: AppBarTitle.DASHBOARD, isActive: false, route: RouteConstants.DASHBOARD),
    DrawerOption(
        name: AppBarTitle.ORDERS, isActive: false, route: RouteConstants.ORDERS),
    DrawerOption(
        name: AppBarTitle.MANAGE_PRODUCTS,
        isActive: false,
        route: RouteConstants.MANAGE_PRODUCTS),
    DrawerOption(
        name: AppBarTitle.REGISTER_DELIVERY_BOY,
        isActive: false,
        route: RouteConstants.REGISTER_DELIVERY_BOY),
  ];
}