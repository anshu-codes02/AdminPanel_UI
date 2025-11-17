import 'package:adminpanel/Screens/DashBoard/components/OrderScreen.dart';
import 'package:adminpanel/Screens/DashBoard/components/Profile.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget{

   const DashBoard({Key?key}): super(key: key);

   @override
  Widget build(BuildContext context) {
      return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const SizedBox(
                  height: 15,
                 ) ,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child:Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(165, 199, 196, 196)
                          ),
                          child: const TextField(
                            cursorHeight: 22,
                            cursorWidth: 1,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(13),
                               prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              hintText: '  Search..',
                              hintStyle: TextStyle(color: Color.fromARGB(57, 51, 50, 50),)
                              
                          )
                        ),
                         )
                      ),
                      const SizedBox(
                        width: 600,
                      ),
                      const Icon(Icons.message_outlined,color: Colors.black54,size: 28,),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.notifications,color: Colors.black54,size: 28,),
                      const SizedBox(
                        width: 20,
                      ),
                     const Profile(),
                    ],
                  ),
                  const SizedBox(
                  height: 25,
                 ) ,
                 Container(
                  width: 1293,
                  height: 700,
                  color: const Color.fromARGB(255, 230, 105, 3).withOpacity(0.1),//Color.fromARGB(192, 250, 230, 213),
                  child: orderScreen(),
                 ),
                ],
              );

  }
}