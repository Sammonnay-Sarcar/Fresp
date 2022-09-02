import 'package:flutter/material.dart';
import 'package:fresp/features/auth/screens/address/address_screen.dart';
import 'package:fresp/features/auth/screens/cart/cart_screen.dart';
Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AddressScreen.routeName:
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (_)=> const AddressScreen(

    )
    
  );
    case CartScreen.routeName:
  return MaterialPageRoute(
    settings: routeSettings,
    builder: (_)=> const CartScreen(

    )
    
  );
  
  default:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> const Scaffold(
        body: Center(
          child: Text('Screen does not exist'),
        ),
      ),

    );

  }
}
