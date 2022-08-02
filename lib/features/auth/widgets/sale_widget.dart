import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fresp/features/auth/widgets/price_widget.dart';
import 'package:fresp/features/auth/widgets/utils.dart';
import 'package:fresp/features/auth/widgets/categories_widgets.dart';
import 'package:fresp/features/auth/widgets/text_widget.dart';

class SaleWidget extends StatefulWidget{
  const SaleWidget({Key? key}) : super(key: key);

  @override 
  State<SaleWidget> createState() => _SaleWidgetState();
}
class _SaleWidgetState extends State<SaleWidget>{
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getscreenSize;

    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor.withOpacity(0.9),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap:() {},
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('https://media.istockphoto.com/photos/farm-market-in-the-fall-apples-picture-id1088157488',
                width:size.width*0.22,
                height:size.width*0.22,
                fit: BoxFit.fill,
                ),
                Row(children: [
                  TextWidget(text:'1kg', color: color, textSize: 22,isTitle: true,),
                  const SizedBox(height: 6,
                  ),
                  Row(children: [
                    GestureDetector(
                      onTap: (){
                        print('print heart button is pressed');
                      },
                      child: Icon(IconlyLight.bag2,size:22,
                      color: color,)
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Icon(IconlyLight.heart,size:22,
                      color: color,)
                    )
                  ],),
                  
                  
                ],),
                const PriceWidget(),
            const SizedBox(height:5),
            TextWidget(text: 'Apples', color: color, textSize: 18,isTitle:true),
            const SizedBox(height:5),
            
              ]
            ),
            
          ]
          ),
          
        )
      )
    );


          
          
  }
}