import 'dart:convert';

import 'package:dio/dio.dart' ;
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class httpServices{
  
  final logger=Logger();
 //final String base_URL="https://admindashboard-backend-gzfl.onrender.com";
 final String base_URL="http://localhost:3000";

  Future<Map<String,dynamic>> getItems({required String endpointsURL}) async{
    final String full_Url=base_URL+endpointsURL;

    try{
       var response=await http.get(Uri.parse(full_Url));

       if(response.statusCode==200)
       {
        logger.i("Items fetched successfully: ${response.body}");
        return jsonDecode(response.body);
       }
       else{
        logger.e("Failed to load data: ${response.statusCode}");
        return {'success': false, 'message': 'Failed to load data'};
       }
    }
    
    catch(error){
      logger.e("Error fetching Items: $error");
      return {'success': false, 'message': error.toString()};
    }
  }

  Future<Map<String,dynamic>?> postItems({required String endpointsURL,required dynamic data,required bool ismultipart}) async{
    final String full_Url=base_URL+endpointsURL;
    
    try{
         var response= await Dio().post(full_Url,
         data: data,
         options: Options(contentType: 
         ismultipart?"multipart/form-data":"application/json",
         responseType: ResponseType.json)
         );

         if(response.statusCode==200 || response.statusCode==201)
         {
           logger.i("Data posted succesfully : ${response.data}");
           return response.data;
         }
         else{
           logger.e('❌ Failed to post data. Status: ${response.statusCode}');
           logger.e('Response: ${response.data}');
           return null;
         }
    }
    catch(error){
      logger.e(error.toString());
      return null;
    
  }
}

 Future<void> UpdateItems({required String endpointsURL,required String id,required Map<String,dynamic> data}) async{
   final String full_Url=base_URL+endpointsURL+id;

   try{
       var response=await http.put(Uri.parse(full_Url),
       headers: 
       {
        "Content-Type":"application/json"
       },
       body: jsonEncode(data)
       );

       if(response.statusCode==200)
       {
         logger.i("Data updated succesfully : ${response.body}");
       }
       else{
        logger.w("Failed to update data. Status: ${response.statusCode}");
       }
   }
   catch(error){
     logger.e(error.toString());
   }
 }

 Future<Map<String,dynamic>?> deleteItems({required String endpointsURL,required String id}) async{
   final String full_Url=base_URL+endpointsURL+id;

   try{
   var response=await Dio().delete(full_Url);

    if(response.statusCode==200)
       {
         logger.i("Data deleted succesfully");
         return response.data;
       }
       else{
        logger.w("Failed to delete data. Status: ${response.data}");
        return null;
       }
   }
   catch(error){
     logger.e(error.toString());
     return null;
   }
 }
}