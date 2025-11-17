import 'package:adminpanel/Screens/Authentication/Profile/components/login_screen.dart';
import 'package:adminpanel/Services/http_services.dart';
import 'package:adminpanel/widgets/snackbar_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier{
    httpServices http= httpServices();
    TextEditingController nameController=TextEditingController();
    TextEditingController emailController=TextEditingController();
    TextEditingController phoneController=TextEditingController();
    TextEditingController addressController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    final key=GlobalKey<FormState>();
    bool _isAuthenticated = false;

    bool get isAuthenticated => _isAuthenticated;

    Future<void> registerUser(BuildContext context)async{
        final navigator= Navigator.of(context);
      try {
        
        Map<String,dynamic> data={
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        };

        final response= await http.postItems(endpointsURL: "/auth/signup", data: data, ismultipart: false);
        if(response!=null && response['success']==true)
        {
             SnackBarHelper.showSuccessSnackBar("User registered successfully");
             
             if(context.mounted)
             {
              navigator.pop();
             }
           
             Future.delayed(const Duration(milliseconds: 300),(){
              showloginForm(context);
             });
             notifyListeners();
        }
        else if(response!=null && response['success']==false)
        {
          SnackBarHelper.showErrorSnackBar("Failed to register:${response['message']}");
        }
      } catch (error) {
        SnackBarHelper.showErrorSnackBar("Failed to register:$error");
      }
    }

    Future<void> loginUser(BuildContext context)async{

      try {
         Map<String,dynamic> data={
          "email": emailController.text,
          "password": passwordController.text,
         };
         
         final response= await http.postItems(endpointsURL: "/auth/login", data: data, ismultipart: false);
         if(response!=null && response['success']==true)
         {
           SnackBarHelper.showSuccessSnackBar("User logged in successfully");
           _isAuthenticated=true;
          await saveToken(response['token']);
           
         }
         else if(response!=null && response['success']==false)
         {
           SnackBarHelper.showErrorSnackBar("Failed to login:${response['message']}");
         }
         
      } catch (error) {
        SnackBarHelper.showErrorSnackBar("Failed to login:$error");
      } 
    }

    Future<void> saveToken(String token)async{
      final prefs=await SharedPreferences.getInstance();
      await prefs.setString('auth-token', token);
    }
    Future<String?> getToken()async{
      final prefs=await SharedPreferences.getInstance();
      String? token=prefs.getString('auth-token');
      _isAuthenticated=(token==null)?false:true;
      return token;
    }

    Future<void> removeToken()async{
      final prefs=await SharedPreferences.getInstance();
      await prefs.remove('auth-token');
    }
}