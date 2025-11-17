import 'package:adminpanel/Screens/MainScreen/components/button.dart';
import 'package:adminpanel/Screens/MainScreen/main_screen_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget{

  const SideMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    
    return 
      Container(
        height: MediaQuery.of(context).size.height,
        width: 240,
        color: Color.fromARGB(167, 24, 23, 23),
        child:Consumer<MainScreenProvider>(builder: (context, menuProvider, child) {
          return  ListView(
          padding: const EdgeInsets.all(7),
          children:[
            Container(
               height: 132,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
               // color: Color.fromARGB(255, 230, 105, 3) 
              ),
              child:const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                     radius: 40, // Circle size
                        backgroundImage: AssetImage('assets/images/logo.png'), 
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("BuyNest",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              )
            ),
            const Divider(
                    color: Colors.white24,
                    thickness: 4,
                    height: 1,
                  ),
            const SizedBox(
              height: 10,
            ),
             buildMenuItem(context, menuProvider, 0, Icons.dashboard, "Dashboard"),
                            buildMenuItem(context, menuProvider, 1, Icons.category, "Categories"),
                            buildMenuItem(context, menuProvider, 2, Icons.subdirectory_arrow_right, "SubCategories"),
                            buildMenuItem(context, menuProvider, 3, Icons.branding_watermark, "Brands"),
                            buildMenuItem(context, menuProvider, 4, Icons.production_quantity_limits, "Products"),
                            buildMenuItem(context, menuProvider, 5, Icons.local_offer, "Coupons"),
                            buildMenuItem(context, menuProvider, 6, Icons.layers, "Variant Types"),
                            buildMenuItem(context, menuProvider, 7, Icons.tune, "Variants"),
                            buildMenuItem(context, menuProvider, 8, Icons.notifications, "Notifications"),
                            buildMenuItem(context, menuProvider, 9, Icons.image, "Posters"),

          ]
        );
        },)
       
      );
    
  }
}