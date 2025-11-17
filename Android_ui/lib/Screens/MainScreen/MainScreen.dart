import 'package:adminpanel/Screens/DashBoard/components/OrderScreen.dart';
import 'package:adminpanel/Screens/DashBoard/components/Profile.dart';
import 'package:adminpanel/Screens/MainScreen/components/side_menu.dart';
import 'package:adminpanel/Screens/MainScreen/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget{
   

  @override
  Widget build (BuildContext context)
  {
    return  Scaffold(
        
        body: Row(
            children: [
             const SideMenu(),
            Consumer<MainScreenProvider>(
              builder: (context, provider, child) {
                return Expanded(
                  flex: 5,
                  child: provider.selectedScreen,
                );
              },
            ),
      
            ],
          ),
        
    );
  }
} 