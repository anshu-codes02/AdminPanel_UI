
import 'package:adminpanel/Screens/VariantType/variantType_provider.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class VariantTypeAdd extends StatelessWidget{

  const VariantTypeAdd({super.key});
  
  @override
  Widget build(BuildContext context)
  {
    final provider = Provider.of<VariantTypeProvider>(context, listen: false);

      var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Form(
        key: provider.formKey,
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
                   Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  
                                  width: 340,
                                 
                                  child: TextFormField(
                                  
                                  controller: provider.controller1,
                                  maxLines: 1,
                                   decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                  labelText: "Name",
                                  labelStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Name is required';
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  ),
                                ),
                              ),
                
                      const SizedBox(
                    height: 42,
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
                         side: BorderSide(
                                         color: Colors.black54, // Border color
                       width: 2, // Border thickness
                        )
                          ),
                           ),
                        onPressed:(){
                          Navigator.of(context).pop();
                        } ,
                          child: Text("cancel",style: TextStyle(fontSize: 17,color: Colors.black54),) 
                         ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10,bottom: 20),
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                                         backgroundColor: Colors.white, // Background color of the button
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20), // Border radius
                         side: BorderSide(
                                         color: Colors.black54, // Border color
                       width: 2, // Border thickness
                        )
                          ),
                           ),
                        onPressed:()async{
                          if(provider.formKey.currentState!.validate())
                          {
                            await provider.AddVariantType();
                            Navigator.of(context).pop();
                          }
                        } ,
                          child: Text("Submit",style: TextStyle(fontSize: 17,color: Colors.black54))
                         ),
                     )
                    ],
                  )   
                  
              ],
            ),
           ),
      ),
    );
  }
}

void showVariantTypeAddform(BuildContext context){
  final provider = Provider.of<VariantTypeProvider>(context, listen: false);
  showDialog(
    barrierDismissible: false,
    context: context,
     builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Center(child: Text('Add Variant Type'.toUpperCase(), style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600))),
        content:  const VariantTypeAdd(),
    );
  }).then((value) {
    provider.clear();
  });
}