import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarHelper
{

 static void showSuccessSnackBar(String message)
 {
  Get.snackbar("Success",
   message,
    icon: const Icon(Icons.check_circle, color: Colors.white),
   titleText: const Text("Success",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
   messageText: Text(message,style: const TextStyle(color: Colors.white,fontSize: 16),),
   snackPosition: SnackPosition.TOP,
   backgroundColor: Colors.green,
   colorText: Colors.white,
   borderRadius: 20,
   margin: const EdgeInsets.symmetric(horizontal: 460,vertical: 10),
  padding: const EdgeInsets.all(10),
   duration: const Duration(seconds: 3),
   isDismissible: true,
   forwardAnimationCurve: Curves.easeOut,
   );
 } 

 static void showErrorSnackBar(String message)
 {
  Get.snackbar("Error",
   message,
   titleText: const Text("Error",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
   messageText: Text(message,style: const TextStyle(color: Colors.white,fontSize: 16),),
   snackPosition: SnackPosition.TOP,
   icon: const Icon(Icons.error,color: Colors.white,),
   backgroundColor: Colors.red,
   colorText: Colors.white,
   borderRadius: 20,
  margin: const EdgeInsets.symmetric(horizontal: 460,vertical: 10),
  padding:const EdgeInsets.all(10),
   duration: const Duration(seconds: 3),
   isDismissible: true,
   forwardAnimationCurve: Curves.easeOut,
   );
 }
}