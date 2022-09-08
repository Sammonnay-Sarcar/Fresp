import 'package:flutter/material.dart';
import 'package:fresp/features/auth/screens/auth_screen.dart';

import 'package:fresp/features/auth/screens/address/address_screen.dart';
import 'package:fresp/features/auth/screens/cart/cart_screen.dart';
import 'package:fresp/features/auth/screens/cart/product_details.dart'; 
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AddressScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddressScreen());
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
      case CartScreen.routeName:
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (_)=> const CartScreen(),
    
  );
      case ProductDetails.routename:
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (_)=> const ProductDetails(),
    
  );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen doesn not exist'),
          ),
        ),
      );
  }
}
