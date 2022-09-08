import 'package:flutter/material.dart';
import 'package:fresp/features/auth/screens/auth_screen.dart';
import 'package:fresp/features/auth/screens/bottom_bar.dart';
import 'package:fresp/features/auth/screens/cart/empty_screen.dart';
import 'package:fresp/features/auth/screens/testscreen.dart';
import 'package:fresp/features/auth/screens/user_screen.dart';
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
  case EmptyCartScreen.routeName:
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (_)=> const EmptyCartScreen(),
  );

    case CartScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CartScreen(),
      );
    case TestScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TestScreen(),
      );
    case BottomBarScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBarScreen(),
      );
    // case UserScreen.routename:

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
