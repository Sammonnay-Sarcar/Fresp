import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fresp/features/auth/widgets/price_widget.dart';
import 'package:fresp/features/auth/widgets/utils.dart';
import 'package:fresp/features/auth/screens/cart/cart_screen.dart';
import 'package:fresp/features/auth/widgets/categories_widgets.dart';
import 'package:fresp/features/auth/widgets/text_widget.dart';

class SaleWidget extends StatefulWidget{
  const SaleWidget({Key? key}) : super(key: key);

  @override 
  State<SaleWidget> createState() => _SaleWidgetState();
}
class _SaleWidgetState extends State<SaleWidget>{

    void navigateToCart(){
    Navigator.pushNamed(context,
     CartScreen.routeName,
     arguments: CartScreen );
    }


     @override 
    Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getscreenSize;

    return Material(
      borderRadius: BorderRadius.circular(15),
      color: Theme.of(context).cardColor.withOpacity(0.9),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap:() {},
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('https://media.istockphoto.com/photos/farm-market-in-the-fall-apples-picture-id1088157488',
                width:size.width*0.22,
                height:size.width*0.15,
                fit: BoxFit.fill,
                ),
                Row(children: [
                  TextWidget(text:'Apples', color: color, textSize: 20,isTitle: true,),
                  const SizedBox(height: 2,
                  ),
                  Row(children: [
                    GestureDetector(
                      onTap: (){
                        navigateToCart();
                      },
                      child: Icon(IconlyLight.bag2,size:22,
                      color: Colors.blue,)
                    ),
                    
                  ],),
                  
                  
                ],),
                const PriceWidget(),
            const SizedBox(height:0.001),
            TextWidget(text: '1kg', color: color, textSize: 14,isTitle:true),
            const SizedBox(height:0.001),
            
              ]
            ),
            
          ]
          ),
          
        )
      )
    );


          
          
  }
}
