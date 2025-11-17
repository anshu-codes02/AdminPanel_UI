import 'dart:io';

import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Screens/Category/cat_provider.dart';
import 'package:adminpanel/Screens/Category/category_screen.dart';
import 'package:adminpanel/Screens/Category/components/category_imagecard.dart';
import 'package:adminpanel/widgets/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryAddForm extends StatelessWidget{

    CategoryAddForm({super.key});

    Widget build(BuildContext context)
    {
      final provider = Provider.of<CatProvider>(context, listen: true);
     
      var size = MediaQuery.of(context).size;
      return SingleChildScrollView(
        child: Form(
          key: provider.addCategoryFormKey,
          child: Container(
             width: size.width*0.3,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1)
            ),
            child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ImageCard(labeltext: "Category", 
                       imageFile: provider.imagePath != null 
                     ? File(provider.imagePath!) 
                     : null, // Set null if imagePath is null
            
                     onTap: () async {
                     await provider.imgPick();
                     },
                      ),
                  Padding(
                    padding: const EdgeInsets.all(19),
                    child: TextFormField(
                        
                              controller: provider.controller,
                              maxLines: 1,
                               decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                              labelText: "Category Name",
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
                             if(value==null || value.isEmpty)
                             {
                              return "Enter Category Name";
                             }
                             return null;
                             }
                            ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Row(
                    children: [
          
                     Padding(
                       padding: const EdgeInsets.only(left: 120,bottom: 20),
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
                        onPressed:()async {
                          if(provider.addCategoryFormKey.currentState!.validate())
                          {
                            if(provider.imagePath==null)
                            {
                              SnackBarHelper.showErrorSnackBar( "Please select an image");
                              return;
                            }
                           
                     await provider.addCategory();
                      
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
        )
      );
    }


}

// How to show the category popup
void showAddCategoryForm(BuildContext context) {
  
  final provider=Provider.of<CatProvider>(context,listen:false);
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Center(child: Text('Add Category'.toUpperCase(), style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600))),
        content: CategoryAddForm(),
      );
    },
  ).then((value) => provider.clearImagePath());
}
