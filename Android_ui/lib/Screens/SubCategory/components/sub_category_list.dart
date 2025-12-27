import 'package:adminpanel/Models/sub_category.dart';
import 'package:adminpanel/Screens/Category/cat_provider.dart';
import 'package:adminpanel/Screens/SubCategory/sub_category_provider.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SubCategoryList extends StatelessWidget{

  const SubCategoryList({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)
  
  {
    return Padding(
      padding: const EdgeInsets.only(left:10, top: 10 ),
      child: Container(
        width: 1199,
        decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.circular(10),
          border: Border.all(
      color: Colors.black54, 
      width: 2.0,        
    ),
        ),
        child:
        SizedBox(
          height: 580,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:  EdgeInsets.only(left: 10,top: 10),
                  child: Text("All SubCategories",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w600),),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<SubCategoryProvider>(
                  builder: (context, provider, child) {
                    if(provider.localSubCategories.isEmpty)
                    {
                      return const Center(
                        child: CircularProgressIndicator());
                    }
                    return DataTable(
                  columnSpacing: 167,
                  columns: const [
                     DataColumn(
                    label: Text("SubCategory Name",style: TextStyle(fontSize: 16),),
                    ),
                    DataColumn(
                    label: Text("Category",style: TextStyle(fontSize: 16),),
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
                  rows: List.generate(provider.localSubCategories.length, (index) => customDataRow(provider.localSubCategories[index],index+1,(){
                  
                   
                  },()
                  {
                    provider.deleteSubCategory(provider.localSubCategories[index].sId!);
                  }))
                   ) ;
                  },
                ),
              ],
            ),
          ),
        ) 
      ),
    );
  }
}

DataRow customDataRow(SubCategory subcategoryInfo, int index,Function edit,Function delete)
{
  return DataRow(
    cells: [
      DataCell(
        Text(subcategoryInfo.name ?? ' ')
       ),
        DataCell(
        Text(subcategoryInfo.categoryId?.name ?? ' ')
       ),
       DataCell(
        Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(subcategoryInfo.createdAt!)))),
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
