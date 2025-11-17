import 'package:adminpanel/Screens/Products/product_provider.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showVariantDialog(BuildContext context) {
  
  final provider2=Provider.of<ProductProvider>(context,listen:false);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Variants'),
        content: SingleChildScrollView(
          child: Consumer<ProductProvider>(builder: (context,provider,child){
           return
          Column(             
            children:provider.SelectedVariant(provider.selectedVariantType, context).map((element) {
              return CheckboxListTile(
               title: Text(element.name ?? ''),
               checkColor: Colors.white,
               activeColor: Colors.black54,
               value: provider.selectedVariants.contains(element.name),
               onChanged: (bool? value) 
               {
                if(value==true)
                {

                  provider.selectedVariants.add(element.name!);
                  provider.selectedVariantids.add(element.sId!);
                }
                else
                {
                  provider.selectedVariants.remove(element.name!);
                  provider.selectedVariantids.remove(element.sId!);
                }
                provider.notifyListeners();
               }
              );
             },
             ).toList(),
        );
          }
      ),
        ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            
          },
          child: Text('OK'),
        ),
      ],
      );
    },
  );
}