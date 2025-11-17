
import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Models/sub_category.dart';
import 'package:adminpanel/Services/http_services.dart';
import 'package:adminpanel/widgets/snackbar_helper.dart';
import 'package:flutter/material.dart';

class BrandProvider extends ChangeNotifier{

  httpServices service=httpServices();
  SubCategory? selectedsubcategory;
  TextEditingController controller1=TextEditingController();
  List<Brand> localBrands=[];

  final BrandFormKey=GlobalKey<FormState>();
  
  Future<void> AllBrands()async{
    try{
   final response=await service.getItems(endpointsURL: "/Brand/");

   if(response!=null && response['success']==true)
   {
    List<dynamic> brands=response['data'];
    localBrands= brands.map((value)=>Brand.fromJson(value)).toList();
    notifyListeners();
   } 
   else if(response!=null && response['success']==false)
   {
    SnackBarHelper.showErrorSnackBar("Failed to get brands:${response['message']}");
   }
  }
  catch(error)
  {
    SnackBarHelper.showErrorSnackBar("Failed to get brands:$error");
  }
  }

  Future<void> AddBrand(SubCategory? subcat)async{
    try {

      Map<String,dynamic> data={
         "name": controller1.text,
         "subCategory": subcat?.sId,
      };
       final response=await service.postItems(endpointsURL: "/Brand/create", data: data, ismultipart: false);
       if(response!=null && response['success']==true)
       {
         SnackBarHelper.showSuccessSnackBar("Brand added successfully");
         localBrands.add(Brand.fromJson(response['data']));
         notifyListeners();
       }
       else if(response!=null && response['success']==false)
       {
         SnackBarHelper.showErrorSnackBar("Failed to add brand:${response['message']}");
       }
    } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to add brand:$error");
    }
  }

  Future<void> deleteBrand(String id)async{
    try {
      final response= await service.deleteItems(endpointsURL: "/Brand/", id: id);
      if(response!=null && response['success']==true)
      {
        localBrands.removeWhere((Brand)=>Brand.sId==id);
        SnackBarHelper.showSuccessSnackBar("Brand deleted successfully");
        notifyListeners();
      }
      else if(response!=null && response['success']==false)
      {
        SnackBarHelper.showErrorSnackBar("Failed to delete brand");
      }
    } catch (error) {
      SnackBarHelper.showErrorSnackBar("Failed to delete brand:$error");
    }
  }

  void clearAll(){
    controller1.clear();
    selectedsubcategory=null;
    notifyListeners();
  }
}