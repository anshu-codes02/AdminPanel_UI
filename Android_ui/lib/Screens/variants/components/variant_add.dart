
import 'package:adminpanel/Models/VariantType.dart';
import 'package:adminpanel/Screens/VariantType/variantType_provider.dart';
import 'package:adminpanel/Screens/variants/variant_provider.dart';
import 'package:adminpanel/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class   VariantAdd extends StatelessWidget{

  const VariantAdd({super.key});
  
  @override
  Widget build(BuildContext context)
  {
    final variantTypeProvider=Provider.of<VariantTypeProvider>(context,listen: false);
      var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Consumer<VariantProvider>(
        builder: (context, provider, child) { 
         
      return Form(
        key: provider.formkey,
        child: Container(
           width: size.width*0.3,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1)
            ),
            child: Column(
              children: [
                 const SizedBox(
                    height: 50,
                 ),
                   Row(
                          children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SizedBox(
                                 
                                  width: 200,
                                 
                                  child: TextFormField(
                                  
                                  controller: provider.controller,
                                  maxLines: 1,
                                   decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                  labelText: "Name",
                                  labelStyle: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
                                                             border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(9.0),
                                   borderSide: const BorderSide(color: Colors.black54),
                                   ),
                                    focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(color: Colors.black54, width: 2),
                                    ), // Orange border when focused
                                   enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(4.0),
                                      borderSide: const BorderSide(color: Colors.black54, width: 2),
                                    ), // Orange border when not focused
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator:(value){
                                    if(value==null || value.isEmpty)
                                    {
                                      return "Please enter variant name";
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                               ),
                                ),
                              ),
                 Padding(
                     padding: const EdgeInsets.only(left: 15),
                     child: SizedBox(
                     
                      width: 200,
                       child: 
                       CustomDropdown<VariantType>(
                        initialvalue:  provider.selectedVariantType,
                         hintText: "VariantType",
                         list: variantTypeProvider.LocalVariantType,
                          onchanged: (newValue){
                          if(newValue!=null)
                          {
                            provider.selectedVariantType=newValue ;
                          }
                        }, 
                         validator: (value) {
                              if (value == null) {
                                return 'Please select a VariantType';
                              }
                              return null;
                            },
                            displayItem: (VariantType? variantType)=>variantType?.name ?? ' ',
                            )
                     ),
                   ),
                  
                          ],
                        ),
                      const SizedBox(
                    height: 49,
                  ),
                  Row(
                    children: [
        
                     Padding(
                       padding: const EdgeInsets.only(left: 124,bottom: 20),
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                                         backgroundColor: Colors.white, // Background color of the button
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20), // Border radius
                         side: const BorderSide(
                                         color: Colors.black54, // Border color
                       width: 2, // Border thickness
                        )
                          ),
                           ),
                        onPressed:(){
                          Navigator.of(context).pop();
                        } ,
                          child: const Text("cancel",style: TextStyle(fontSize: 17,color: Colors.black54),) 
                         ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10,bottom: 20),
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                                         backgroundColor: Colors.white, // Background color of the button
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20), // Border radius
                         side: const BorderSide(
                                         color: Colors.black54, // Border color
                       width: 2, // Border thickness
                        )
                          ),
                           ),
                        onPressed:(){
                          if(provider.formkey.currentState!.validate())
                          {
                            provider.createVariant(provider.selectedVariantType!);
                            Navigator.of(context).pop();
                          }
                          
                        } ,
                          child: const Text("Submit",style: TextStyle(fontSize: 17,color: Colors.black54))
                         ),
                     )
                    ],
                  )   
                  
              ],
            ),
           ),
      );
        }
      )
    );
  }
}

void showvariantAddform(BuildContext context){
  final provider = Provider.of<VariantProvider>(context, listen: false);
  showDialog(
    barrierDismissible: false,
    context: context,
     builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Center(child: Text('Add Variant'.toUpperCase(), style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600))),
        content:  const VariantAdd(),
    );
  }).then((value) => provider.ClearAll());
}