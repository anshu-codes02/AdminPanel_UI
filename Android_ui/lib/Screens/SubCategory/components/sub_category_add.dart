
import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Screens/Category/cat_provider.dart';
import 'package:adminpanel/Screens/SubCategory/sub_category_provider.dart';
import 'package:adminpanel/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SubCatAdd extends StatelessWidget{

  const SubCatAdd({super.key});
  
  @override
  Widget build(BuildContext context)
  {
    final provider = Provider.of<SubCategoryProvider>(context, listen: false);
     final Catprovider = Provider.of<CatProvider>(context, listen: false);
   
      var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key:provider.subCatFormKey,
        child: Container(
           width: 464,
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
                                padding: const EdgeInsets.only(left: 15),
                                child: SizedBox(
                                  //height: 49,
                                  width: 200,
                                 
                                  child: TextFormField(
                                  
                                  controller: provider.controller1,
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
                                  validator: (value){
                                    if(value==null || value.isEmpty)
                                    {
                                      return "Enter Sub-Category name";
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                   ),
                                ),
                              ),
                 Padding(
                     padding: const EdgeInsets.only(left: 10,right: 10),
                     child: SizedBox(
                     // height: 58,
                      width: 215,
                       child: 
                       CustomDropdown<category>(
                        initialvalue:  provider.selectedcategory, hintText: "Category", list: Catprovider.localCategories, onchanged: (newValue){
                          if(newValue!=null)
                          {
                            provider.selectedcategory=newValue ;
                          }
                        },  validator: (value) {
                              if (value == null) {
                                return 'Please select a category';
                              }
                              return null;
                            },
                            displayItem: (category? category)=>category?.name ?? ' ',
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
                        onPressed:()async{
                          if(provider.subCatFormKey.currentState!.validate())
                          {
                            await provider.AddSubCategory(provider.selectedcategory);
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
      ),
    );
  }
}

void showsubcatAddform(BuildContext context){
   final provider=Provider.of<SubCategoryProvider>(context,listen:false);
    final size = MediaQuery.of(context).size;
   
  showDialog(
    barrierDismissible: false,
    context: context,
     builder: (BuildContext context) {
      
    return AlertDialog(
     
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Center(child: Text('Add Sub-Category'.toUpperCase(), style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600))),
        content:ConstrainedBox(constraints: 
        const BoxConstraints(
         minWidth: 464, // Set a minimum width for the dialog
            maxWidth:490, // Optional: max width to prevent it from getting too wide
        ) ,
        child: const SubCatAdd()
        )
        
    );
  }).then((value) {
    provider.clear();
  });
}