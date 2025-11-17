import 'package:adminpanel/Models/VariantType.dart';
import 'package:adminpanel/Models/variants.dart';
import 'package:adminpanel/Services/http_services.dart';
import 'package:adminpanel/widgets/snackbar_helper.dart';
import 'package:flutter/material.dart';

class VariantProvider extends ChangeNotifier{
 
   final TextEditingController controller = TextEditingController();
   httpServices service=httpServices();
   final formkey=GlobalKey<FormState>();
   VariantType? selectedVariantType;

  

   List<Variant> localvariants=[];

   Future<void> AllVariants()async{
    try {
      final response= await service.getItems(endpointsURL: "/Variant/");
      if( response['success']==true)
      {
        List<dynamic> variants=response['data'];
        localvariants=variants.map((e)=>Variant.fromJson(e)).toList();
        notifyListeners();
      }
      else if(response['success']==false)
      {
        SnackBarHelper.showErrorSnackBar("Failed to get variants:${response['message']}");
      }
    } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to get variants:$error");
    }
   }

   Future<void> createVariant(VariantType? variantType)async{
      try {

             Map<String,dynamic> variant={
               "name":controller.text,
               "variantTypeId":variantType!.sId
             };
        final response = await service.postItems(endpointsURL: "/Variant/create", data: variant,ismultipart: false);
        if(response!=null && response['success']==true)
        {
           Variant newVariant=Variant.fromJson(response['data']);
           localvariants.add(newVariant);
           notifyListeners();
           SnackBarHelper.showSuccessSnackBar("Variant added successfully");
        }
        else if(response!=null && response['success']==false)
        {
          SnackBarHelper.showErrorSnackBar("Failed to add variant:${response['message']}");
        }
      } catch (error) {
        SnackBarHelper.showErrorSnackBar("Failed to add variant:$error");
      } 
   }
   
   Future<void> DeleteVariant(String id)async{
    try {
      final response = await service.deleteItems(endpointsURL: "/Variant/delete/",id: id);
      if(response!=null && response['success']==true)
      {
        localvariants.removeWhere((element) => element.sId==id);
        notifyListeners();
        SnackBarHelper.showSuccessSnackBar("Variant deleted successfully");
      }
      else if(response!=null && response['success']==false)
      {
        SnackBarHelper.showErrorSnackBar("Failed to delete variant:${response['message']}");
      }
    } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to delete variant:$error");
    }
   }

   void ClearAll()
   {
    controller.clear();
    selectedVariantType=null;
    notifyListeners();
   }
}