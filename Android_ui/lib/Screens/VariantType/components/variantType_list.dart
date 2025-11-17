import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Models/VariantType.dart';
import 'package:adminpanel/Screens/VariantType/variantType_provider.dart';
import 'package:adminpanel/Screens/variants/variant_provider.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VariantTypeList extends StatelessWidget{

  const VariantTypeList({Key? key}): super(key: key);
  
  @override
  Widget build(BuildContext context)
  
  {
    return Padding(
      padding: const EdgeInsets.only(left:140, top: 10 ),
      child: Container(
        width: 920,
        decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.circular(10),
          border: Border.all(
      color: Colors.black54, 
      width: 2.0,        
    ),
        ),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:  EdgeInsets.only(left: 10,top: 10),
              child: Text("All Variant Types",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<VariantTypeProvider>(
              builder: (context, provider, child) {
                if(provider.LocalVariantType.isEmpty)
                {
                  return const Center(
                    child: CircularProgressIndicator());
                }
                return DataTable(
              columnSpacing: 167,
              columns: const [
                 DataColumn(
                label: Text("VariantType Name",style: TextStyle(fontSize: 16),),
                ),
               
                 DataColumn(
                label: Text("Added Date",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Edit",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Delete",style: TextStyle(fontSize: 16),),
                ),
    
              ],
              rows: List.generate(provider.LocalVariantType.length, (index) => customDataRow(provider.LocalVariantType[index],index+1,(){
              
               
              },()
              {
                provider.DeleteVariantType(provider.LocalVariantType[index]);
              }))
               ) ;
              },
            ),
          ],
        ) 
      ),
    );
  }
}

DataRow customDataRow(VariantType variantTypeInfo, int index,Function edit,Function delete)
{
  return DataRow(
    cells: [
      DataCell(
        Text(variantTypeInfo.name ?? ' ')
       ),
       DataCell(
        Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(variantTypeInfo.createdAt!)))),
      DataCell(IconButton(
          onPressed: () {
            edit();
          },
          icon:const Icon(
            Icons.edit,
            color: Colors.black54,
          ))),
      DataCell(IconButton(
          onPressed: () {
            delete();
          },
          icon:const Icon(
            Icons.delete,
            color: Color.fromARGB(255, 230, 105, 3),
          ))),
    ]);
}


