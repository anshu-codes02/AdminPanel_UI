import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget{

  const ActionButton({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 230, 105, 3), // Background color
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Border radius
              ),
            ),
            onPressed:(){
            Navigator.pop(context);
            } ,
             child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),)),
             SizedBox(
              width: 20,
             ),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 230, 105, 3), // Background color
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Border radius
              ),
            ),
              onPressed: (){
                Navigator.pop(context);
             },
              child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),))
        ],
      ),
    );
  }
}