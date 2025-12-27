import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Models/Product.dart';
import 'package:adminpanel/Screens/Products/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget{

  const ProductList({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)
  
  {
    return Padding(
      padding: const EdgeInsets.only(left:10, top: 10 ),
      child: Container(
        width: 1225,
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
              child: Text("All Products",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<ProductProvider>(
              builder: (context, provider, child) {
                if(provider.localproducts.isEmpty)
                {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return DataTable(
              columnSpacing: 110,
              columns: const [
                 DataColumn(
                label: Text("Product Name",style: TextStyle(fontSize: 16),),
                ),
                
                DataColumn(
                label: Text("Sub-Category",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Category",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Price",style: TextStyle(fontSize: 16),),
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
              rows: List.generate(provider.localproducts.length, (index) => customDataRow(provider.localproducts[index],index+1,(){
              
               
              },()
              {
            provider.deleteProduct(provider.localproducts[index].sId!);
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

DataRow customDataRow(Product productInfo, int index,Function edit,Function delete)
{
  return DataRow(
    cells: [
      DataCell(
        Text(productInfo.name ?? ' ')
       ),
        DataCell(
        Text(productInfo.proSubCategoryId?.name ?? ' ')
       ),
        DataCell(
        Text(productInfo.proCategoryId?.name ?? ' ')
       ),
        DataCell(
        Text(productInfo.price.toString() ?? ' ')
       ),
       DataCell(
        Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(productInfo.createdAt!)))),
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


