import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Models/Product.dart';
import 'package:adminpanel/Models/VariantType.dart';
import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Models/sub_category.dart';
import 'package:adminpanel/Models/variants.dart';
import 'package:adminpanel/Screens/Brands/brand_provider.dart';
import 'package:adminpanel/Screens/SubCategory/sub_category_provider.dart';
import 'package:adminpanel/Screens/variants/variant_provider.dart';
import 'package:adminpanel/Services/http_services.dart';
import 'package:adminpanel/widgets/snackbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductProvider extends ChangeNotifier {
  String? imagePath1;
  String? imagePath2;
  String? imagePath3;
  String? imagePath4;
  
  httpServices service=httpServices();
  FilePickerResult? result1;
  FilePickerResult? result2;
  FilePickerResult? result3;
  FilePickerResult? result4;

  MultipartFile?  multipartfile1;
  MultipartFile?  multipartfile2;
  MultipartFile?  multipartfile3;
  MultipartFile?  multipartfile4;

   final productFormKey=GlobalKey<FormState>();
 TextEditingController name_controller=TextEditingController();
 TextEditingController description_controller=TextEditingController();
 TextEditingController price_controller=TextEditingController();
 TextEditingController quantity_controller=TextEditingController();

 List<String> selectedVariants=[];
 List<String> selectedVariantids=[];
 List<Variant> localvariants=[];
 List<Product> localproducts=[];
 category? selectedcategory;
 SubCategory? selectedsubCategory;
 Brand? selectedbrand;
 VariantType? selectedVariantType;


 void setSelectedCategory(category? value, BuildContext context) {
    selectedcategory = value;
    // Reset subcategory when category changes
    notifyListeners(); // Trigger rebuild
  }

  void setSelectedSubCategory(SubCategory? value, BuildContext context) {
    selectedsubCategory = value;
    
    notifyListeners(); // Trigger rebuild
  }

  void setSelectedVariantType(VariantType? value,BuildContext coontext)
  {
     selectedVariantType=value;
     selectedVariants.clear();
     notifyListeners();
  }
 List<SubCategory> selectedSubcat(BuildContext context)
 {
  final provider=Provider.of<SubCategoryProvider>(context,listen: false);
  if(selectedcategory!=null)
  {
   List<SubCategory> subcategories=[];
    subcategories= provider.localSubCategories.where((element) => element.categoryId!.sId==selectedcategory!.sId).toList();
   
    return subcategories;
  }
    return [];
 }

 List<Brand> selectedBrands(BuildContext context)
 {
  final provider=Provider.of<BrandProvider>(context,listen: false);
  if(selectedsubCategory!=null)
  {

    return provider.localBrands.where((element) => element.subcategoryId!.sId==selectedsubCategory!.sId).toList();
    
  }
  
    return [];
 }

 List<Variant> SelectedVariant(VariantType? selectedVariantType,BuildContext context)
 {
  final provider=Provider.of<VariantProvider>(context,listen: false);
  if(selectedVariantType==null)
  {
    return [];
  }

  return provider.localvariants.where((element) => selectedVariantType.sId==element.variantTypeId!.sId).toList();
 }

 Future<void> AllProducts()async{
   try {
      final response= await service.getItems(endpointsURL: "/Product/");

      if( response['success']==true)
      {
        List<dynamic> products=response['data'];
        localproducts=products.map((e)=>Product.fromJson(e)).toList();
        notifyListeners();
      }
      else if(response['success']==false)
      {
        SnackBarHelper.showErrorSnackBar("Failed to get products:${response['message']}");
      }
   } catch (error) {
     SnackBarHelper.showErrorSnackBar("Failed to get products:$error");
   }
 }

 Future<void> createProduct() async {
print("selectedVariantids before sending: $selectedVariantids"); // Debug log
        Map<String,dynamic> data={
          "name": name_controller.text,
          "description": description_controller.text,
          "price": double.tryParse(price_controller.text),
          "quantity":int.tryParse(quantity_controller.text),
          "Category": selectedcategory?.sId,
          "subCategory": selectedsubCategory?.sId,
          "Brand": selectedbrand?.sId,
          "variantType": selectedVariantType?.sId,
          "variant": selectedVariantids,
        }; 
        
        FormData formData=await createFormData(data: data);
        print("formData: $formData"); // Debug log
    try {
      final response =await service.postItems(endpointsURL: "/Product/create", data: formData, ismultipart: true);
      
      if(response!=null && response['success']==true)
      {
        Product newProduct=Product.fromJson(response['data']);
        localproducts.add(newProduct);
        notifyListeners();

        SnackBarHelper.showSuccessSnackBar("Product added successfully");
      }
      else if(response!=null && response['success']==false)
      {
        SnackBarHelper.showErrorSnackBar("Failed to add product:${response['message']}");
      }
} catch (error) {
   SnackBarHelper.showErrorSnackBar("Failed to add product:$error");
}
 }

   
   Future<FormData> createFormData({required Map<String,dynamic> data}) async {
    
       multipartfile1=await createMultifile(result: result1);
        multipartfile2=await createMultifile(result: result2);
        multipartfile3=await createMultifile(result: result3);
       multipartfile4=await createMultifile(result: result4);

       data['image1']=multipartfile1;
       data['image2']=multipartfile2;
       data['image3']=multipartfile3;
       data['image4']=multipartfile4;

       FormData formData=FormData.fromMap(data);
       return formData;
      }

  Future<MultipartFile> createMultifile({required FilePickerResult? result}) async{
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
      return multipartfile;
  }

 Future<void> deleteProduct(String id) async{
  try{
     final response= await service.deleteItems(endpointsURL: "/Product/delete/", id: id);
     if(response!=null &&response['success']==true)
     {
        localproducts.removeWhere((element)=> element.sId==id!);
        notifyListeners();
        SnackBarHelper.showSuccessSnackBar("Product deleted successfully");
     }
     else if(response!=null && response['success']==false)
     {
      SnackBarHelper.showErrorSnackBar("Failed to delete product:${response['message']}");
     }
  }
  catch(error)
  {
    SnackBarHelper.showErrorSnackBar("Failed to delete product:$error");
  }
 }


 String AllSelectedVariant()
 {
  return selectedVariants.join(',');
 }
  
 
  Future<void> AddProduct()async{
     
  }

Future<void> getImg() async{
    result1=await FilePicker.platform.pickFiles(type: FileType.image);
    if(result1!=null){
      imagePath1=result1!.files.single.path;
     
  }
   notifyListeners();
} 

Future<void> getImg2() async{
    result2=await FilePicker.platform.pickFiles(type: FileType.image);
    if(result2!=null){
      imagePath2=result2!.files.single.path;
     
  }
   notifyListeners();
} 

Future<void> getImg3() async{
     result3=await FilePicker.platform.pickFiles(type: FileType.image);
    if(result3!=null){
      imagePath3=result3!.files.single.path;
     
  }
   notifyListeners();
} 

Future<void> getImg4() async{
     result4=await FilePicker.platform.pickFiles(type: FileType.image);
    if(result4!=null){
      imagePath4=result4!.files.single.path;
  }
   notifyListeners();
} 

void clearImagePath(){
    imagePath1=null;
    imagePath2=null;
    imagePath3=null;
    imagePath4=null;
    result1=null;
    result2=null;
    result3=null;
    result4=null;
    name_controller.clear();
    description_controller.clear();
    price_controller.clear();
    quantity_controller.clear();
    selectedcategory=null;
    selectedsubCategory=null;
    selectedbrand=null;
    selectedVariantType=null;
    selectedVariants.clear();
    selectedVariantids.clear();
    notifyListeners();
  }
}