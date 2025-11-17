import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Services/http_services.dart';
import 'package:adminpanel/widgets/snackbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger=Logger();
class CatProvider extends ChangeNotifier{
   
  httpServices service=httpServices();
  String _categoryName="";
  String get CatName=> _categoryName;
   final addCategoryFormKey = GlobalKey<FormState>();
   List<category> localCategories=[];
   String? imagePath;
  
   final TextEditingController controller=TextEditingController();
 FilePickerResult? result;
  Future<void> imgPick() async{
     result=await FilePicker.platform.pickFiles(type: FileType.image);

     if(result!=null){
      imagePath=result!.files.single.path;
     }
     notifyListeners();
  }
  
  Future<void> addCategory()async
  {
  
     Map<String,dynamic> formDataMap={
      "name": controller.text,
     
     };
     FormData formData=await createformData(result: result, data: formDataMap);
     try{
      final response=await service.postItems(endpointsURL: "/Category/create",data: formData,ismultipart: true);
      if(response!=null && response["success"]==true){
        SnackBarHelper.showSuccessSnackBar("Category added successfully");
        category newcategory=category.fromJson(response["data"]);
        localCategories.add(newcategory);
        notifyListeners();

      }
      else if(response!=null && response["success"]==false){
        SnackBarHelper.showErrorSnackBar("Failed to add category:${response["message"]}");
      }
     }
     catch(error){
      SnackBarHelper.showErrorSnackBar("Failed to add category:$error");
     }
     
    }

    Future<void> deleteCategory(String id)async{
      try{
        
        final response=await service.deleteItems(endpointsURL: '/Category/delete/', id: id);
        if(response!=null && response['success']==true)
        {
          localCategories.removeWhere((category) => category.sId == id);
          SnackBarHelper.showSuccessSnackBar("Category deleted successfully");
          notifyListeners();
        }
        else if(response!=null && response['success']==false)
        {
          SnackBarHelper.showErrorSnackBar("Failed to delete category");
         
        }
      }
      catch(error){
        SnackBarHelper.showErrorSnackBar("Failed to delete category:$error");
      }
    }

    Future<void> allCategories()async{
      try{
       
         final response= await service.getItems(endpointsURL: '/Category/');

       if(response!=null)
       {
         List<dynamic> categories=response['data'];
         if(categories.isNotEmpty)
         {
            localCategories=categories.map((e)=>category.fromJson(e)).toList();
           
            notifyListeners();
         }
         else{
          SnackBarHelper.showErrorSnackBar("No categories found");
         }
           
       }
      }
      catch(error){
        SnackBarHelper.showErrorSnackBar("Failed to get categories:$error");
      }
    }

  Future<FormData> createformData({required FilePickerResult? result,required Map<String,dynamic> data}) async{
     
     MultipartFile multipartfile;
     PlatformFile file=result!.files.first;
     if(kIsWeb)
     {
      String filename=file.name;
      Uint8List bytes=file.bytes!;
      multipartfile=MultipartFile.fromBytes(bytes,
      filename: filename);
      }
      else
      {
        multipartfile=await MultipartFile.fromFile(file.path!,filename: file.name
        );
         
      }
      data['image']=multipartfile;
      FormData formData=FormData.fromMap(data);
      return formData;
  }
  void clearImagePath(){
    result=null;
    imagePath=null;
    controller.clear();
    notifyListeners();
  }
}

/*
now on category screen ,
i made add button to add category name , and img , how to code submit function ,
 that is when i click submit it is stored in , make fn in catprovider */