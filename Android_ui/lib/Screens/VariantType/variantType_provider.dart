import 'package:adminpanel/Models/VariantType.dart';
import 'package:adminpanel/Services/http_services.dart';
import 'package:adminpanel/widgets/snackbar_helper.dart';
import 'package:flutter/material.dart';

class VariantTypeProvider extends ChangeNotifier{
  
   final TextEditingController controller1 = TextEditingController();
   List<VariantType> LocalVariantType=[];
   httpServices service=httpServices();
   final formKey = GlobalKey<FormState>();

   Future<void> AddVariantType()async{
    try {
        Map<String,dynamic> data={
          'name':controller1.text
        };
        final response=await service.postItems(endpointsURL: "/VariantType/create", data: data,ismultipart: false);
        if(response!=null && response['success']==true)
        {
           LocalVariantType.add(VariantType.fromJson(response['data']));
           SnackBarHelper.showSuccessSnackBar("Variant Type Added Successfully");
           notifyListeners();
        }
        else if(response!=null && response['success']==false)
        {
          SnackBarHelper.showErrorSnackBar("Failed to add variant type:${response['message']}");
        }
    } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to add variant type:$error");
    } 
   }

   Future<void> AllVariantType()async{
    try {
      final response=await service.getItems(endpointsURL: "/VariantType/");
      if(response!=null && response['success']==true)
      {
         List<dynamic> data=response['data'];
        LocalVariantType=data.map((e)=>VariantType.fromJson(e)).toList();
        notifyListeners();
      }
      else if(response!=null && response['success']==false)
      {
        SnackBarHelper.showErrorSnackBar("Failed to get variant type:${response['message']}");
      }
    } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to get variant type:$error");
    } 
   }
   
   Future<void> DeleteVariantType(VariantType varianttype)async{
    try {
      final response=await service.deleteItems(endpointsURL: "/VariantType/delete/",id:varianttype.sId!);
      if(response!=null && response['success']==true)
      {
       
        LocalVariantType.removeWhere((element) => element.sId==varianttype.sId);
        notifyListeners();
        SnackBarHelper.showSuccessSnackBar("Variant Type Deleted Successfully");
      }
      else if(response!=null && response['success']==false)
      {
        SnackBarHelper.showErrorSnackBar("Failed to delete variant type:${response['message']}");
      }
    } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to delete variant type:$error");
    } 
   }

   void clear(){
    controller1.clear();
    notifyListeners();
   }
}