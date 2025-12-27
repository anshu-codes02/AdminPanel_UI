
import 'package:adminpanel/Models/Product.dart';
import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Screens/Category/cat_provider.dart';
import 'package:adminpanel/Screens/Coupons/coupon_provider.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:adminpanel/widgets/custom_datepicker.dart';
import 'package:adminpanel/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CouponAdd extends StatelessWidget{

  const CouponAdd({super.key});
  
  @override
  Widget build(BuildContext context)
  {
    final provider = Provider.of<CouponProvider>(context, listen: false);
    final provider3=Provider.of<CatProvider>(context,listen: false);
     final dataprovider = Provider.of<DataProvider>(context, listen: false);
   

      var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
         width: size.width*0.52,
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const SizedBox(
                  height: 50,
               ),
                 Row(
                   children: [
                     Padding(
                                  padding: const EdgeInsets.only(left: 30,top: 20),
                                  child: Container(
                                    height: 43,
                                    width: 350,
                                   
                                    child: TextFormField(
                                    
                                    controller: provider.couponController,
                                    maxLines: 1,
                                     decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                    labelText: "Coupon Code",
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
                                    
                                    ),
                                  ),
                                ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,top: 20),

                        child: SizedBox(
                          height: 57,
                          width: 350,
                          child: CustomDropdown(
                            hintText: "Status",
                             list: provider.status,
                              onchanged:(newValue)
                              {
                                provider.selectedStatus= newValue;
                              },
                               validator: (value) => value == null ? 'Please select a Discount Type' : null,
                                displayItem: (item) => item),
                        )
                              )
                   ],
                 ),
              
                 Row(
                   children: [
                     Padding(
                                  padding: const EdgeInsets.only(left: 30,top: 20),
                                  child: Container(
                                    height: 43,
                                    width: 350,
                                   
                                    child: TextFormField(
                                    
                                    controller: provider.discountAmountController,
                                    maxLines: 1,
                                     decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                    labelText: "Discount Amount",
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
                                    
                                    ),
                                  ),
                                ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,top: 20),

                        child: SizedBox(
                          height: 57,
                          width: 350,
                          child: CustomDropdown(
                            hintText: "Discount Type",
                             list: provider.discountType,
                              onchanged:(newValue)
                              {
                                provider.selectedDiscountType= newValue;
                              },
                               validator: (value) => value == null ? 'Please select a Discount Type' : null,
                                displayItem: (item) => item),
                        )
                              )
                   ],
                 ),
                  Row(
                   children: [
                     Padding(
                                  padding: const EdgeInsets.only(left: 30,top: 20),
                                  child: Container(
                                    height: 43,
                                    width: 350,
                                   
                                    child: TextFormField(
                                    
                                    controller: provider.minimumPurchaseAmountController,
                                    maxLines: 1,
                                     decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                    labelText: "Minimum Purchase Amount",
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
                                    
                                    ),
                                  ),
                                ),
                           Padding(
                                  padding: const EdgeInsets.only(left: 30,top: 20),
                                  child: Container(
                                    height: 43,
                                    width: 350,
                                   
                                    child: CustomDatePicker(
                                    labeltext: "End Date",
                                
                                     controller: provider.endDateController,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100)
                                    )
                                  ),
                                ),
                     
                   ],
                 ),
              
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.only(left: 30,top: 20),

                        child: SizedBox(
                          height: 57,
                          width: 240,
                          child: CustomDropdown<category>(
                            hintText: "Category",
                             list: provider3.localCategories,
                              onchanged:(newValue)
                              {
                                provider.selectedCategory= newValue;
                              },
                               validator: (value) => value == null ? 'Please select a Category' : null,
                                displayItem: (item) => item.name ?? ' '),
                        )
                              ),
                  Padding(
                        padding: const EdgeInsets.only(left: 10,top: 20),

                        child: SizedBox(
                          height: 57,
                          width: 240,
                          child: CustomDropdown(
                            hintText: "Sub-Category",
                             list: dataprovider.subCategories,
                              onchanged:(newValue)
                              {
                                provider.selectedSubCategory= newValue;
                              },
                               validator: (value) => value == null ? 'Please select a Sub-Category' : null,
                                displayItem: (item) => item.name ?? ' '),
                        )
                              ),
                Padding(
                        padding: const EdgeInsets.only(left: 10,top: 20),

                        child: SizedBox(
                          height: 57,
                          width: 230,
                          child: CustomDropdown<Product>(
                            hintText: "Product",
                             list: dataprovider.products,
                              onchanged:(newValue)
                              {
                                provider.selectedProduct= newValue;
                              },
                               validator: (value) => value == null ? 'Please select a Product' : null,
                                displayItem: (item) => item.name ?? ' '),
                        )
                              )              
                ],
              ),
                    const SizedBox(
                  height: 42,
                ),
                Row(
                  children: [

                   Padding(
                     padding: const EdgeInsets.only(left: 294,bottom: 20),
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
                      onPressed:(){
                        
                      } ,
                        child: Text("Submit",style: TextStyle(fontSize: 17,color: Colors.black54))
                       ),
                   )
                  ],
                )   
                
            ],
          ),
         ),
    );
  }
}

void showCouponAddform(BuildContext context){
  
  showDialog(
    barrierDismissible: false,
    context: context,
     builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Center(child: Text('Add Coupon'.toUpperCase(), style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600))),
        content:  const CouponAdd(),
    );
  });
}