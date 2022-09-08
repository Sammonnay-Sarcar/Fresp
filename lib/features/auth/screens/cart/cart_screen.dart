


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
        backgroundColor: Colors.green,
        title: TextWidget(text:'Cart(2)',color: Color.fromARGB(255, 255, 255, 255),
        textSize: 22,),
        actions: [
        IconButton(onPressed: (){}, icon: Icon(IconlyBroken.delete,),
        color: Colors.white,),

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
                FittedBox( child:TextWidget(text: 'Total Rs.500', color: Colors.black, textSize: 20,isTitle: true,),),
                const Spacer(),
                Material(
                  color: Color.fromARGB(255, 7, 100, 11),
                  borderRadius: BorderRadius.circular(10),
                  child:InkWell(borderRadius:BorderRadius.circular(12),
                  onTap:navigateToAddress,  
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(text:'Order Now',textSize: 20,
                    color: Colors.white,),
                  )
                  
                  )),
                  
                  
              ],),
            )
            
          );}
}
  
  