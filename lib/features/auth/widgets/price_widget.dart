import 'package:flutter/material.dart';
import 'package:fresp/features/auth/widgets/text_widget.dart';
import '../widgets/utils.dart';

class PriceWidget extends StatelessWidget{
  const PriceWidget({Key? key}):super(key : key);

  @override 
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return FittedBox(child:Row(
        children: [
          TextWidget(
            text:'Rs.100', 
            color: Colors.green, 
            textSize: 22
            ),
            
            ],
            )
            );
 
  }
}
