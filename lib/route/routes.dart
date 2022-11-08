// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String becomeExclusive = '/become_exclusive';
  static const String register = '/register';
  static const String splash = '/';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';
  static const String otp = '/otp';
  static const String profile = '/profile';
  static const String editProfile = '/edit_profile';
  static const String search = '/search';
  static const String seeMore = '/see-more';
  static const String product = '/product';
  static const String addProduct = '/add_product';
  static const String category = '/category';
  static const String categories = '/categories';
  static const String vendor = '/vendor';
  static const String boutiqueBySecteur = '/boutique_by_secteur';
  static const String editBoutiqueBySecteur = '/egit_boutique_by_secteur';
  static const String shop = '/secteur';
  static const String notification = '/notifications';
  static const String hasNotification = '/has_notifications';
  static const String wishList = '/wish_list';
  static const String favoritesBoutiques = '/boutique_favories';
  static const String abonnements = '/abonnements';
  static const String noInternet = '/no-internet';


  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    //
    // Widget isLoggedIn(Widget loggedWidget, { Widget notLogged=const LoginScreen() }) => Consumer<AuthProvider>(
    //   builder: (context, auth, child) {
    //   return  auth.isLoggedIn() ? (loggedWidget) : notLogged;
    //   },
    //
    // );


    switch(settings.name) {
      case login:
        // return MaterialPageRoute(builder: (context) => isLoggedIn( const DashBoardScreen()) );
      default:
        return MaterialPageRoute(builder: (context) =>  Container());
    }
  }

  static void goTo(BuildContext context, String routeName, {Object? arguments}) {
    // //verify if the route is already open
    // if (ModalRoute.of(context)!.settings.name == routeName) {
    //   //if the route is already open, remove it from the stack
    //   Navigator.popUntil(context, ModalRoute.withName(routeName));
    // }
    // Navigator.pushNamed(context, routeName, arguments: arguments);
    Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (route) => route.isCurrent &&
        ModalRoute.of(context)?.settings.name ==  routeName ? false :true, arguments: arguments);
  }

}