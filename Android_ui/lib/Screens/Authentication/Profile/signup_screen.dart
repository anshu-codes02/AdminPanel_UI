import 'package:adminpanel/Screens/Authentication/Profile/auth.dart';
import 'package:adminpanel/Screens/Authentication/Profile/components/login_screen.dart';
import 'package:adminpanel/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final provider=Provider.of<ProfileProvider>(context,listen: false);
    return SingleChildScrollView(
      child: Form(
        key: provider.key,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          color: Colors.orange.withOpacity(0.1),
          child: Column(
            children: [
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.all( 20),
                child: CustomTextField(
                  controller: provider.nameController,
                  labelText: "Name",
                  validator: (value) {
                    if(value==null || value.isEmpty)
                    {
                      return "Name is required";
                    }
                    return null;
                  },
                )
                 ),
                 Padding(
                padding: const EdgeInsets.all( 20),
                child: CustomTextField(
                  controller: provider.emailController,
                  labelText: "Email",
                  validator: (value) {
                    if(value==null || value.isEmpty)
                    {
                      return "Email is required";
                    }
                    return null;
                  },
                )
                 ),
                 Padding(
                padding: const EdgeInsets.all( 20),
                child: CustomTextField(
                  controller: provider.passwordController,
                  labelText: "Password",
                  validator: (value) {
                    if(value==null || value.isEmpty)
                    {
                      return "Password is required";
                    }
                    return null;
                  },
                )
                 ),
                 SizedBox(
                  height: 10,
                 ),
                 Row(
                  children:[
                   Padding(
                       padding: const EdgeInsets.only(left: 120,bottom: 20),
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                                         backgroundColor: Colors.white, // Background color of the button
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20), // Border radius
                         side: BorderSide(
                                         color: Colors.black54, // Border color
                       width: 2, // Border thickness
                        )
                          ),
                           ),
                        onPressed:(){
                          
                          Navigator.of(context).pop();
                        } ,
                          child: Text("cancel",style: TextStyle(fontSize: 17,color: Colors.black54),) 
                         ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10,bottom: 20),
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                                         backgroundColor: Color.fromARGB(255, 230, 105, 3), // Background color of the button
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20), // Border radius
                         side: BorderSide(
                                         color: Color.fromARGB(255, 230, 105, 3), // Border color
                       width: 2, // Border thickness
                        )
                          ),
                           ),
                        onPressed:() async{
                          if(provider.key.currentState!.validate())
                          {
                            Navigator.of(context).pop();
                          }
                        } ,
                          child: Text("Sign up",style: TextStyle(fontSize: 17,color: Colors.white))
                         ),
                     )
                  
                    ],
      
                 ),
                 
                 Padding(
                  padding: const EdgeInsets.only(bottom: 30,top: 20),
                  child: GestureDetector(
                    onTap: (){
                      
                      Navigator.of(context).pop();
                      showloginForm(context);
                      
                    },
                    child: Text("Login user?",style: TextStyle(color: Color.fromARGB(255, 230, 105, 3),fontWeight: FontWeight.bold,fontSize: 16),)
                  ))
            ],
            )
        ) )
    );
  }
}


void showSignupForm(BuildContext context){
  showDialog(
    barrierDismissible: false,
    context: context, builder: (BuildContext context){
       return AlertDialog(
         backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Center(child: Text('Signup', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,letterSpacing: 2))),
        content: SignupScreen(),
       );
  });
}