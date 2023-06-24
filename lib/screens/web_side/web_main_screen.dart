import 'package:ecco_app/screens/web_side/addProducts_Screen.dart';
import 'package:ecco_app/screens/web_side/dashboard_screen.dart';
import 'package:ecco_app/screens/web_side/deleteProducts_Screen.dart';
import 'package:ecco_app/screens/web_side/updateProducts_Screen.dart';
import 'package:ecco_app/screens/web_side/web_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class WebMainScreen extends StatefulWidget {
  static const String id = 'webmain';
  WebMainScreen({super.key});

  @override
  State<WebMainScreen> createState() => _WebMainScreenState();
}

class _WebMainScreenState extends State<WebMainScreen> {
  Widget selectedSCreen = DashboardScreen();
  /*chooseScreens start here*/
  chooseScreens(item) {
    switch (item.route) {
      case DashboardScreen.id:
        setState(() {
          selectedSCreen = DashboardScreen();
        });
        break;
      case AddProductScreen.id:
        setState(() {
          selectedSCreen = AddProductScreen();
        });
        break;
      case UpdateProductScreen.id:
        setState(() {
          selectedSCreen = UpdateProductScreen();
        });
        break;
      case DeleteProductScreen.id:
        setState(() {
          selectedSCreen = DeleteProductScreen();
        });
    }
  }

  /*chooseScreens end here*/
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          title: const Text('ADMIN'),
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
          ),
        ),
        /*sideBar start here*/
        sideBar: SideBar(
          items: [
            AdminMenuItem(
              title: "DASHBOARD",
              icon: Icons.dashboard,
              route: DashboardScreen.id,
            ),
            AdminMenuItem(
              title: "ADD PRODUCTS",
              icon: Icons.add,
              route: AddProductScreen.id,
            ),
            AdminMenuItem(
              title: "UPDATE PRODUCTS",
              icon: Icons.update,
              route: UpdateProductScreen.id,
            ),
            AdminMenuItem(
              title: "DELETE PRODUCTS",
              icon: Icons.delete,
              route: DeleteProductScreen.id,
            ),
            AdminMenuItem(
              title: "CART ITEMS",
              icon: Icons.shop,
            ),
          ],
          backgroundColor: Colors.black,
          selectedRoute: WebMainScreen.id,
          textStyle: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
          onSelected: (item) {
            chooseScreens(item);
          },
        ),
        /*sideBar end here*/
        body: selectedSCreen);
  }
}
