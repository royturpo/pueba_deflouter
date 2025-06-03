import 'package:ventas_app/theme/AppTheme.dart';
import 'package:ventas_app/drawer/drawer_user_controller.dart';
import 'package:ventas_app/drawer/home_drawer.dart';
import 'package:ventas_app/ui/help_screen.dart';
import 'package:flutter/material.dart';
import 'package:ventas_app/ui/producto/producto_main.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HelpScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      //color: AppTheme.themeData.primaryColor,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.themeData.primaryColor,
          //appBar: CustomAppBar(accionx: accion as Function),
          body: DrawerUserController(
            screenIndex: drawerIndex!!,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView!!,
            drawerIsOpen: (bool ) {  },
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = MainProducto();
        });
      } else if (drawerIndex == DrawerIndex.Imagex) {
        setState(() {
          //screenView = MainUploadImage();
        });
      } else {
        //do in your way......
      }
    }
  }
}
