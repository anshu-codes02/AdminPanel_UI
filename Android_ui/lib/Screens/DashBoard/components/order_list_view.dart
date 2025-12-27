import 'package:adminpanel/Models/Order/Order.dart';
import 'package:adminpanel/Screens/DashBoard/components/order_form.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderList extends StatelessWidget{

  const OrderList({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
        height: 380, // or MediaQuery.of(context).size.height * 0.6
      child: Padding(
        padding: const EdgeInsets.only(left:10, top: 10 ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: 847,
            decoration: BoxDecoration(
              color: Colors.white,
             borderRadius: BorderRadius.circular(10)
            ),
            child:
            Consumer<DataProvider>(
              builder: (context, dataprovider, child) {
                return DataTable(
              columnSpacing: 17,
              columns: const [
                 DataColumn(
                label: Text("Customer Name"),
                ),
                 DataColumn(
                label: Text("Order Amount"),
                ),
                 DataColumn(
                label: Text("Payment"),
                ),
                 DataColumn(
                label: Text("Status"),
                ),
                 DataColumn(
                label: Text("Date"),
                ),
                 DataColumn(
                label: Text("Edit"),
                ),
                 DataColumn(
                label: Text("Delete"),
                ),
              ],
              rows: List.generate(dataprovider.orders.length, (index) => customDataRow(dataprovider.orders[index],index+1,(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderForm(order: dataprovider.orders[index]),
                  )
               );
              },()
              {
          
              }))
               ) ;
              },
            ) 
          ),
        ),
      ),
    );
  }
}

DataRow customDataRow(Order orderInfo, int index,Function edit,Function delete)
{
  return DataRow(
    cells: [
      DataCell(Text(orderInfo.userId?.name ?? '' )),
       DataCell(Text('${orderInfo.orderTotal?.total}')),
      DataCell(Text(orderInfo.paymentMethod ?? '')),
      DataCell(Text(orderInfo.orderStatus ?? '')),
      DataCell(Text(orderInfo.orderDate ?? '')),
      DataCell(IconButton(
          onPressed: () {
            if (edit != null) edit();
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.black87,
          ))),
      DataCell(IconButton(
          onPressed: () {
            if (delete != null) delete();
          },
          icon: const Icon(
            Icons.delete,
            color: Color.fromARGB(255, 230, 105, 3),
          ))),
    ]);
}