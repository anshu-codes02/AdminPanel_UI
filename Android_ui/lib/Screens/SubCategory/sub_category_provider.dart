import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Models/sub_category.dart';
import 'package:adminpanel/Services/http_services.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:adminpanel/widgets/snackbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubCategoryProvider extends ChangeNotifier{
  httpServices service=httpServices();
  List<SubCategory> localSubCategories=[];
 final TextEditingController controller1 = TextEditingController();
 final subCatFormKey=GlobalKey<FormState>();
  String? _subCategoryname;
   String? get  subcatname=>_subCategoryname;
   
   category? selectedcategory;

  Future<void> AllSubCategories()async{
   
    try {
      final response=await service.getItems(endpointsURL: '/subCategory/');
      if(response!=null)
      {

        List<dynamic> subcategories=response['data'];
        if(subcategories.isNotEmpty)
        {
          localSubCategories=subcategories.map((e)=>SubCategory.fromJson(e)).toList();
        }
        else{
          SnackBarHelper.showErrorSnackBar("No subcategories found");
        }
      }
    } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to get subcategories:$error");
      
    }
    notifyListeners();
  }

  Future<void> AddSubCategory(category? cat)async{
    
    try {
        Map<String,dynamic> subcat={
          "name":controller1.text,
          "CategoryId":cat!.sId
        };
                
        final response=await service.postItems(endpointsURL: '/subCategory/create', data: subcat,ismultipart: false);
       
        if(response!=null && response["success"]==true){
           SnackBarHelper.showSuccessSnackBar("Subcategory added successfully");
           
           localSubCategories.add(SubCategory.fromJson(response['data']));
           notifyListeners(); 
        }
        else if(response!=null && response["success"]==false)
        {
          SnackBarHelper.showErrorSnackBar("Failed to add subcategory,${response["message"]}");
        }
    } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to add subcategory:$error");
    }
  }

Future<void> deleteSubCategory(String id)async{
   try {
     final response= await service.deleteItems(endpointsURL: "/subCategory/", id: id);
     if(response!=null && response['success']==true)
     {
        localSubCategories.removeWhere((SubCategory)=>SubCategory.sId==id);
        SnackBarHelper.showSuccessSnackBar("Sub Category deleted successfully");
        notifyListeners();
     }
      else if(response!=null && response['success']==false)
        {
          SnackBarHelper.showErrorSnackBar("Failed to delete Sub Category");
        }
   } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to delete category:$error");
   }
}

  void clear(){
 selectedcategory=null;
 controller1.clear();
 notifyListeners();
  }
}
