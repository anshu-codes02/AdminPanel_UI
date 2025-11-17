import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Screens/Brands/brand_provider.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BrandList extends StatelessWidget{

  const BrandList({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)
  
  
  {
    return Padding(
      padding: const EdgeInsets.only(left:10, top: 10 ),
      child: Container(
        width: 1120,
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
              child: Text("All Brands",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<BrandProvider>(
              builder: (context, provider, child) {
                if(provider.localBrands.isEmpty)
                {
                  return const Center(
                    child: CircularProgressIndicator());
                }
                return DataTable(
              columnSpacing: 167,
              columns: const [
                 DataColumn(
                label: Text("Brand Name",style: TextStyle(fontSize: 16),),
                ),
                DataColumn(
                label: Text("Sub-Category",style: TextStyle(fontSize: 16),),
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
              rows: List.generate(provider.localBrands.length, (index) => customDataRow(provider.localBrands[index],index+1,(){
              
               
              },()
              {
               provider.deleteBrand(provider.localBrands[index].sId!);
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

DataRow customDataRow(Brand brandInfo, int index,Function edit,Function delete)
{
  return DataRow(
    cells: [
      DataCell(
        Text(brandInfo.name ?? ' ')
       ),
        DataCell(
        Text(brandInfo.subcategoryId?.name ?? ' ')
       ),
       DataCell(
        Text(DateFormat("yyyy-MM-dd").format(DateTime.parse(brandInfo.createdAt!)))),
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


