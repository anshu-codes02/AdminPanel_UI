import 'package:adminpanel/Screens/Authentication/Profile/signup_screen.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget{

  const Profile({Key?key}): super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return  Container(
                         width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                             color: const Color.fromARGB(192, 250, 230, 213),
                          ),
                          child:  Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              const CircleAvatar(
                                radius: 19,
                                backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                              ),
                               const SizedBox(
                                width: 13,
                              ),
                              const Text("Jin Woo Sung",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Colors.black54),
                              ),
                               const SizedBox(
                                width: 13,
                              ),
                              IconButton(onPressed: (){
                                showSignupForm(context);
                              }, 
                              icon: const Icon(Icons.keyboard_arrow_down))
                            ],
                          ),
                      );
}
}