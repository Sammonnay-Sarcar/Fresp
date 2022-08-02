
import 'package:flutter/material.dart';
import 'package:fresp/features/auth/widgets/categories_widgets.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CategoriesWidget(),
      ),
    );
    
  }
}