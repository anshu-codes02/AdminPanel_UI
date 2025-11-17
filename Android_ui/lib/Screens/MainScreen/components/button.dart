import 'package:adminpanel/Screens/MainScreen/main_screen_provider.dart';
//import 'package:adminpanel/provider.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

Widget buildMenuItem(BuildContext context,MainScreenProvider menuprovider,int index,IconData icon,String title){
  bool isSelected=menuprovider.selectedIndex==index;

  return ListTile(
              leading:  Icon(
              icon,
              color: isSelected ? Color.fromARGB(255, 230, 105, 3) : Colors.white70,),
              title: Text(title,style: TextStyle(color: isSelected ? Color.fromARGB(255, 230, 105, 3) : Colors.white70,),),
              onTap: () {
                 menuprovider.updateindex(index);
                 menuprovider.navigatetoScreen(title,context);
              },
  );

}