import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? labelText;
  void Function(String?)? onsave;
  String? Function(String?)? validator;
  int? lineNo;

  CustomTextField({super.key,this.controller, this.labelText, this.onsave, this.validator, this.lineNo});
  
  @override
  Widget build(BuildContext context) {
     return TextFormField(
       controller: controller,
       maxLines: lineNo,
        decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                            labelText: labelText,
                            labelStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            validator: validator,
                            onSaved: onsave,
     );
  }
}