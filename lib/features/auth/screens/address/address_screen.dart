
import 'package:flutter/material.dart';
import 'package:fresp/common/widgets/custom_text_field.dart';

class AddressScreen extends StatefulWidget{
  static const String routeName = '/address'; 
  const AddressScreen({Key? key}) :super(key: key);

  @override
  State<AddressScreen> createState()=> _AddressScreenState();
}
class _AddressScreenState extends State<AddressScreen>{
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController towncityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();
  @override
  void dispose(){
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    towncityController.dispose();
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: Form(
        key: _addressFormKey,
        child: Column(children: [
          CustomTextField(
            controller: flatBuildingController,
            hintText: 'Flat,House Number,Building',
          ),
          const SizedBox(height:10),
          CustomTextField(
            controller: areaController,
            hintText: 'Area,Street',

          ),
          const SizedBox(height:10),
          CustomTextField(
            controller: pincodeController,
            hintText: 'Pincode',

          ),
           const SizedBox(height:10),
          CustomTextField(
            controller: towncityController,
            hintText: 'Town/City',

          ),
          
           
          
        ]
        ),
      )

    );
  }
}