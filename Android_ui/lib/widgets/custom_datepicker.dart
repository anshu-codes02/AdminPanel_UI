import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  
  final String labeltext;
  final TextEditingController controller;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const CustomDatePicker({super.key,
  required this.labeltext,
  required this.controller,
  required this.initialDate,
  required this.firstDate,
  required this.lastDate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
        icon: Icon(Icons.calendar_today),
        fillColor: Colors.white,
        filled: true,
        
         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(9.0),
                             borderSide: const BorderSide(color: Colors.black54),
                             ),
                              focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(color: Colors.black54, width: 2),
                              ), // Orange border when focused
                             enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(4.0),
                                borderSide: const BorderSide(color: Colors.black54, width: 2),
                              ), // Orange border when not focused
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a date';
                              }
                              return null;
                            },
                            
                  onTap: () async{
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: firstDate,
                      lastDate: lastDate,
                      builder: (context,child)
                      {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Color.fromARGB(255, 230, 105, 3), // header text color
                             
                             // onSurface: Colors.black54, // body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: Color.fromARGB(255, 230, 105, 3), // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      }
                    );
                    if (picked != null) {
                      String formatDate= DateFormat('yyyy-MM-dd').format(picked);
                      controller.text = formatDate;
                    }
                   
                  },          
    );
  }
}