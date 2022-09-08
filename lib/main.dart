import 'package:flutter/material.dart';
import 'package:fresp/constants/global_variables.dart';
import 'package:fresp/features/auth/screens/bottom_bar.dart';
import 'package:fresp/features/auth/screens/auth_screen.dart';
//import 'package:fresp/features/auth/screens/homescreen.dart';
import 'package:fresp/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthScreen _auth = AuthScreen();
  //final bool isLogged = await AuthScreen.isLogged();
  //final MyApp myApp = MyApp(
    //initialRoute: isLogged ? '/home' : '/',
  //);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  final String ? initialRoute;
  const MyApp({this.initialRoute,});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fresp',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              )),
        ),
        //routes: {
        //'/': (context) => AuthScreen(),
        //'/home': (context) => HomeScreen(),
        
      //},
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const BottomBarScreen());
    // appBarTheme:
    // const AppBarTheme(
    //     elevation: 0,
    //     iconTheme: IconThemeData(
    //       color: Colors.black,
    //     ));
    // onGenerateRoute:
    // (settings) => generateRoute(settings);
    // home:
    // const AuthScreen();
    
  }
}
