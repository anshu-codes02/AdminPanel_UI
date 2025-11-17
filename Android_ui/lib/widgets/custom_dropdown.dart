import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
 final T? initialvalue;
 final String? hintText;
 final List<T> list;
 final void Function(T?)? onchanged;
 final String? Function(T?) validator;
 final String Function(T) displayItem;
  const CustomDropdown({Key? key,
   this.initialvalue,
  required this.hintText,
  required this.list,
  required this.onchanged,
  required this.validator,
  required this.displayItem}): super(key : key);

 @override
 Widget build(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: DropdownButtonFormField<T>(
      
      decoration: InputDecoration(
        labelText: hintText,
         fillColor: Colors.white, // Background color
       filled: true, // Ensures the background color is applied
        labelStyle: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
         
     focusedBorder:const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black54, width: 2), // Border color when focused
    ),
     enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(4.0),
                              borderSide: const BorderSide(color: Colors.black54, width: 2),
                            ), 
      ),
      value: initialvalue,
      items: list.map((T value){
       return DropdownMenuItem<T>(
        value: value,
        child: Text(displayItem(value),style:const TextStyle(fontSize: 14,color: Colors.black54,fontWeight: FontWeight.w700),));
      }).toList(),
       onChanged: onchanged,
       validator: validator,
       autovalidateMode: AutovalidateMode.onUserInteraction,
       elevation: 0,

       ),
  );
 }

}