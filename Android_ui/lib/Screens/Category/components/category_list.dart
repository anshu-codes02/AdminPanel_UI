import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Screens/Category/cat_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class CategoryList extends StatelessWidget{

  const CategoryList({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return 
    Padding(
      padding: const EdgeInsets.only(left:10, top: 10 ),
      child: Container(
        width: 1090,
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
              child: Text("All Categories",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<CatProvider>(
              builder: (context, catprovider, child) {
                 if(catprovider.localCategories.isEmpty){
                    return Center(child: CircularProgressIndicator());
    }
                return DataTable(
              columnSpacing: 207,
              columns: const [
                 DataColumn(
                label: Text("Category Name",style: TextStyle(fontSize: 16),),
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
              rows: List.generate(catprovider.localCategories.length, (index) => customDataRow(catprovider.localCategories[index],index+1,(){
              
            
              },()
              {
               catprovider.deleteCategory(catprovider.localCategories[index].sId!);
               
              })
              )
               );
              },
            ),
          ],
        ) 
      ),
    );
  }
}

DataRow customDataRow(category categoryInfo, int index,Function edit,Function delete)
{
  
  return DataRow(
    cells: [
      DataCell(
        Row(
          
          children: [
            Image.network(
              categoryInfo.image ?? ' ',
              height: 30,
              width: 30,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error_outline,color: Colors.red);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(categoryInfo.name ?? ''),
            ),
          ],
        )),
       DataCell(
        Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(categoryInfo.createdAt!)))),
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
            if (delete != null) delete();
          },
          icon:const Icon(
            Icons.delete,
            color: Color.fromARGB(255, 230, 105, 3),
          ))),
    ]);
}