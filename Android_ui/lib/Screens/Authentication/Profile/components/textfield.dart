import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{

  final TextEditingController controller;
  final String labeltext;
  final String? Function(String?)? validator;

  const CustomTextField({super.key, required this.controller, required this.labeltext, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  maxLines: 1,
                  controller: controller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: labeltext,
                    labelStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29.0),
                      borderSide: const BorderSide(color: Colors.black54),
                    )
                  ),
                  validator: validator,
                  keyboardType: TextInputType.name,
                );
  }
}