import 'package:adminpanel/Models/coupon.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CouponList extends StatelessWidget{

  const CouponList({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)
  
  {
   final dataprovider = Provider.of<DataProvider>(context,listen: false);
    return Padding(
      padding: const EdgeInsets.only(left:10, top: 10 ),
      child: Container(
        width: 1130,
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
              child: Text("All Coupons",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(
              height: 10,
            ),
            DataTable(
              columnSpacing: 127,
              columns: const [
                 DataColumn(
                label: Text("Coupon Name",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Status",style: TextStyle(fontSize: 16),),
                ),
                DataColumn(
                label: Text("Discount Amount",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("endDate",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Edit",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Delete",style: TextStyle(fontSize: 16),),
                ),
    
              ],
              rows: List.generate(dataprovider.coupons.length, (index) => customDataRow(dataprovider.coupons[index],index+1,(){
              
               
               },()
               {
             
              }
              )
              )
               )
          ]
        ) 
      ),
    );
  }
}

DataRow customDataRow(Coupon couponInfo, int index,Function edit,Function delete)
{
  return DataRow(
    cells: [
      DataCell(
        Text(couponInfo.couponCode ?? ' ')
       ),
        DataCell(
        Text(couponInfo.status ?? ' ')
       ),
       DataCell(
        Text(couponInfo.discountAmount.toString())),
         DataCell(
        Text(couponInfo.endDate ?? ' ')
       ),
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


