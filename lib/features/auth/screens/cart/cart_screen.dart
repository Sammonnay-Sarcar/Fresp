


import'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fresp/features/auth/screens/cart/cart_widget.dart';
import 'package:fresp/features/auth/widgets/text_widget.dart';
import 'package:fresp/features/auth/widgets/utils.dart';
import 'package:fresp/features/auth/screens/address/address_screen.dart';
class CartScreen extends StatefulWidget{
  static const String routeName = '/cart'; 
  const CartScreen({Key? key}) : super(key:key);

  @override 
  State<CartScreen> createState()=> _CartScreenState();
}
class _CartScreenState extends State<CartScreen>{
  void navigateToAddress(){
    Navigator.pushNamed(context,
     AddressScreen.routeName,
     arguments: AddressScreen );
  }
  @override
  Widget build(BuildContext context) {
     final Color color =Utils(context).color;
    return  Scaffold(
      appBar: AppBar(
        elevation:0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(text:'Cart(2)',color: color,isTitle: true,
        textSize: 22,),
        actions: [
        IconButton(onPressed: (){}, icon: Icon(IconlyBroken.delete,),
        color: color,),

      ]),
      body:Column(
        children: [
          _checkout(ctx: context),
          

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CartWidget();
              },
              ),
          ),
        ],
      ),
    );
  }
  Widget _checkout({required BuildContext ctx,
  }){
    return SizedBox(
            width:double.infinity,
            height: 50,
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal:12),
              child: Row(children: [
                Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  child:InkWell(borderRadius:BorderRadius.circular(12),
                  onTap:navigateToAddress,  
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(text:'Order Now',textSize: 20,
                    color: Colors.white,),
                  )
                  
                  )),
                  const Spacer(),
                  FittedBox( child:TextWidget(text: 'Total Rs.500', color: Colors.black, textSize: 20,isTitle: true,),),
              ],),
            )
            
          );}
}
  
  