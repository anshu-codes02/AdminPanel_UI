import 'dart:io';

import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Models/VariantType.dart';
import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Models/sub_category.dart';
import 'package:adminpanel/Screens/Category/cat_provider.dart';
import 'package:adminpanel/Screens/Category/components/category_imagecard.dart';
import 'package:adminpanel/Screens/MainScreen/main_screen_provider.dart';
import 'package:adminpanel/Screens/Products/components/variantDialog.dart';
import 'package:adminpanel/Screens/Products/product_provider.dart';
import 'package:adminpanel/Screens/VariantType/variantType_provider.dart';
import 'package:adminpanel/widgets/custom_dropdown.dart';
import 'package:adminpanel/widgets/custom_textField.dart';
import 'package:adminpanel/widgets/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductAdd extends StatelessWidget {
  const ProductAdd({super.key});

  @override
  Widget build(BuildContext context) { 
    final provider=Provider.of<ProductProvider>(context,listen: false);
     final provider2=Provider.of<MainScreenProvider>(context,listen: false);
     final provider3=Provider.of<CatProvider>(context,listen: false);
     final provider4=Provider.of<VariantTypeProvider>(context,listen: false);
    return Form(
      key: provider.productFormKey,
      child: Container(
          width: double.infinity,
        height: double.infinity,
          color: const Color.fromARGB(255, 230, 105, 3).withOpacity(0.2), // Background color
          child:
               SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                   child:  Consumer<ProductProvider>(builder: (context,provider,child){ 
                    return
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [                      
                        const Padding(
                          padding:  EdgeInsets.only(top: 20, left: 500,bottom: 30),
                          child: Text("ADD PRODUCT",style:  TextStyle(color: Colors.black54,fontWeight: FontWeight.w700,fontSize: 34)),
                        ),
                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageCard(
                                labeltext: "Main Image",
                                imageFile: provider.imagePath1 != null
                                    ? File(provider.imagePath1!)
                                    : null,
                                onTap: () async {
                                  await provider.getImg();
                                }),
                                 const SizedBox(
                          width: 20,
                        ),
                                ImageCard(
                                labeltext: "2nd Image",
                                imageFile: provider.imagePath2 != null
                                    ? File(provider.imagePath2!)
                                    : null,
                                onTap: () async {
                                  await provider.getImg2();
                                }),
                              const SizedBox(
                               width: 20,
                                 ),
                              ImageCard(
                                labeltext: "3rd Image",
                                imageFile: provider.imagePath3 != null
                                    ? File(provider.imagePath3!)
                                    : null,
                                onTap: () async {
                                  await provider.getImg3();
                                }),
                               const SizedBox(
                                   width: 20,
                                 ),
                                ImageCard(
                                labeltext: "4th Image",
                                imageFile: provider.imagePath4 != null
                                    ? File(provider.imagePath4!)
                                    : null,
                                onTap: () async {
                                  await provider.getImg4();
                                }),
                          ],
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(top: 70,left: 250),
                          child: SizedBox(
                            width: 800,
                            //height: 50,
                            child: CustomTextField(
                              controller: provider.name_controller,
                              labelText: "Product Name",
                              lineNo: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a name';
                                }
                                return null;
                              },
                            
                            ),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(top: 20,left: 250),
                          child: SizedBox(
                            width: 800,
                            
                            child: CustomTextField(
                              controller: provider.description_controller,
                              labelText: "Description",
                              lineNo: 3,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 244,top: 20),
                              child: SizedBox(
                                width: 240,
                               
                                child: CustomDropdown(
                                  hintText: "Category",
                                   list:provider3.localCategories ,
                                    onchanged: (value){
                                      provider.setSelectedCategory(value, context);
                                     },
                                     validator: (value){
                                      if(value==null){
                                        return 'Please select a category';
                                      }
                                      return null;
                                     },
                                      displayItem: (category? value)=>value?.name ?? ''
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 45,top: 20),
                              child: SizedBox(
                                width: 240,
                               
                                child: CustomDropdown(
                                  
                                  hintText: "Sub-Category",
                                   list:provider.selectedSubcat(context),
                                    onchanged: (value){
                                      provider.setSelectedSubCategory(value, context);
                                     },
                                     validator: (value){
                                      if(value==null){
                                        return 'Please select a sub-category';
                                      }
                                      return null;
                                     },
                                      displayItem: (SubCategory? value)=>value?.name ?? ''
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 48,top: 20),
                              child: SizedBox(
                                width: 240,
                               
                                child: CustomDropdown(
                                  hintText: "Brand",
                                   list:provider.selectedBrands( context),
                                    onchanged: (value){
                                      provider.selectedbrand=value;
                                     },
                                     validator: (value){
                                      if(value==null){
                                        return 'Please select a brand';
                                      }
                                      return null;
                                     },
                                      displayItem: (Brand? value)=>value?.name ?? ''
                                      ),
                              ),
                            )
                          ],
                        ),
                          Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 243,top: 20),
                              child: SizedBox(
                                width: 240,
                               
                                child: CustomDropdown(
                                  hintText: "Variant Type",
                                   list: provider4.LocalVariantType,
                                  onchanged: (value){
                                    provider.setSelectedVariantType(value, context);
                                  },
                                 validator: (value){
                                  if(value==null){
                                    return 'Please select a variant type';
                                  }
                                  return null;
                                 },
                               displayItem: (VariantType? value)=>value?.name ?? '')
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.only(left: 338,top: 20),
                              child: SizedBox(
                                width: 234,
                                height: 52,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    side: const BorderSide(
                                      color: Colors.black54,
                                      width: 2.0,
                                    ),
                                  ),
          
                                  onPressed: (){
                                    showVariantDialog(context);
                                },
                                 child:
                                 Text(provider.selectedVariants.length==0?"Select variants":provider.AllSelectedVariant(),style:const TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w600),))
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 246,top: 20),
                              child: SizedBox(
                                width: 394,
                               
                                child: CustomTextField(
                                  controller: provider.price_controller,
                                  labelText: "Price",
                                  lineNo: 1,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a price';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.only(left: 21,top: 20),
                              child: SizedBox(
                                width: 394,
                                child: CustomTextField(
                                  controller: provider.quantity_controller,
                                  labelText: "Quantity",
                                  lineNo: 1,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a quantity';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                              children: [   
                                Padding(
                              padding: const EdgeInsets.only(left: 524,bottom: 20),
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
                              provider.clearImagePath();
                             provider2.navigatetoScreen("Products", context);
                            } ,
                              child: const Text("cancel",style: TextStyle(fontSize: 17,color: Colors.black54),) 
                             ),
                                ),
                          Padding(
                           padding: const EdgeInsets.only(left: 20,bottom: 20),
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
                              if(provider.productFormKey.currentState!.validate())
                              {
                                if(provider.result1==null || provider.result2==null || provider.result3==null || provider.result4==null)
                                {
                                  SnackBarHelper.showErrorSnackBar("Please select images");
                                  return;
                                }
                                await provider.createProduct();
                               provider2.navigatetoScreen("Products", context);
                              }
                            } ,
                              child: const Text("Submit",style: TextStyle(fontSize: 17,color: Colors.black54))
                             ),
                               )
                            ],
                          ),
                        )   
                      ],
                    );
                   }
                   )
                  ),
      ),
    );
  }
}

   
