import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageCard extends StatelessWidget{

  String labeltext;
  File? imageFile;
   VoidCallback onTap;  
     
   ImageCard({super.key,required this.labeltext,required this.imageFile,required this.onTap});

  Widget build(BuildContext context)
  {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child:
       Container(
         height: 130,
          width: size.width * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          
           child: imageFile == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, size: 50, color: Colors.grey[600]),
                SizedBox(height: 8),
                Text(
                  labeltext,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: kIsWeb
                  ? Image.network(
                      imageFile?.path ?? '',
                      width: double.infinity,
                      height: 102,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      imageFile!,
                      width: double.infinity,
                      height: 102,
                      fit: BoxFit.cover,
                    ),
            ),
),
    );
    }
}