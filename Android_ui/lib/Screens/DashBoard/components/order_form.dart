import 'package:adminpanel/Models/Order/Order.dart';
import 'package:adminpanel/Screens/DashBoard/components/action_button.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:adminpanel/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OrderForm extends StatelessWidget{
  final Order? order;
  const OrderForm({Key?key,this.order}):super(key: key);

  @override
  Widget build (BuildContext context){
    final TextEditingController controller=TextEditingController();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: DefaultTextStyle.merge(
          style: const TextStyle(decoration: TextDecoration.none),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:  EdgeInsets.only(top: 10,left: 480),
                child: Text("Order Details",style: TextStyle(color: Colors.black54,fontSize: 34,fontWeight: FontWeight.bold),) ),
                Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Text("Order ID: "+ ("${order?.sId}" ?? "N/A"),style: const TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.w600),) ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 140),
                  child: Container(
                    
                    width: 900,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                      border: Border.all(
                  color: Colors.black54, // Border color
                  width: 1.0, // Border width
                ),
                    ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Text("Customer Name: "+ ("${order?.userId?.name}" ?? " N/A" ),style: const TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w600),) ),
               const Padding(
                padding:  EdgeInsets.only(top: 10,left: 10),
                child: Text("Items: ",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w600),) ),
               
                SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child:order?.items != null && order!.items!.isNotEmpty
              ? DataTable(
          columnSpacing: 10.0,
          columns: const [
            DataColumn(
                label: Text("Product ID",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Product Name",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Quantity",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Price",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: order!.items!.map((item) {
            return DataRow(cells: [
              DataCell(Text(item.productId ?? "N/A")),
              DataCell(Text(item.productName ?? "N/A")),
              DataCell(Text(item.quantity?.toString() ?? "N/A")),
              DataCell(Text(item.price?.toString() ?? "N/A")),
            ]);
          }).toList(),
                )
              : const Padding(
                padding:  EdgeInsets.only(top: 10,left: 10),
                child: Text("No items Available",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w600),
                ),
                 ),
                ),
                 Padding(
                padding:  const EdgeInsets.only(top: 10,left: 10,bottom: 10),
                child: Text("Total Price:   ${order?.totalPrice.toString() ?? "N/A "}",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w600),
                ),
                 ),
          
                    ],
                  )
                  ),
                   ),
              shippingAddress(order),
              paymentDetails(order),
              Padding(
                padding: EdgeInsets.only(top: 20,left: 140),
                child: Row(
                  children: [
                    const Text("Order Status:",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w600),),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Consumer<DataProvider>(
            builder: (context, dataprovider, child){
                      return SizedBox(
                       width: 170,
                       height: 67,
                        child:Material(child: CustomDropdown(initialvalue: "Shipped", hintText: "Status", list: ["Pending","Processed","Shipped"],
                         onchanged: (newvalue)async {
                          if(newvalue!=null)
                          {
                            await dataprovider.updatedStatus(order?.sId, newvalue);
                          }
                         },
                          validator: (value) {
                          if (value == null) {
                            return 'Please select status';
                          }
                          return null;
                        },
                        displayItem: (value)=>value,
                        ),
                        )
                      );
            }
                       )
                    )
                  ],
                ),
                 ),
                Padding(
                  padding: EdgeInsets.only(top: 10,left: 140),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       const Text("Tracking URL:",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w600),),
                       Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: SizedBox(
                           width: 170,
                       height: 67,
                        
                          child: Material(
                            child: TextFormField(
                            controller: controller,
                            maxLines: 1,
                             decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                            labelText: "Tracking URL",
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(4.0),
                             borderSide: const BorderSide(color: Color.fromARGB(255, 230, 105, 3)),
                             ),
                              focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 230, 105, 3), width: 2.5),
                              ), // Orange border when focused
                             enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(4.0),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 230, 105, 3), width: 2.5),
                              ), // Orange border when not focused
                            ),
                            keyboardType: TextInputType.text,
          
                          ),
                          )
                        ), )
                    ],
                  ) ),
                ActionButton()
            ],
          ),
        ),
      ),
    );
  }
}

Widget shippingAddress(Order? order){
  return Padding(
            padding:const EdgeInsets.only(top: 30,left: 140),
            child: Container(
              width: 900,
               decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                    border: Border.all(
                color: Colors.black54, // Border color
                width: 1.0, // Border width
              ),
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const  Padding(
              padding:  EdgeInsets.only(top: 10,left: 10),
              child: Text("Shipping Address",style: TextStyle(color: Colors.black87,fontSize: 17,fontWeight: FontWeight.w600),
              ),
               ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text("Phone:        ${order?.shippingAddress?.phone ?? "N/A"}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text("Street:        ${order?.shippingAddress?.street ?? "N/A"}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text("City:           ${order?.shippingAddress?.city ?? "N/A"}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text("State:         ${order?.shippingAddress?.state ?? "N/A"}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text("Postal Code:       ${order?.shippingAddress?.postalCode ?? "N/A"}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10,bottom: 10),
        child: Text("Country:     ${order?.shippingAddress?.country ?? "N/A "}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
                  ],
                ),
            ),
             );
}

Widget paymentDetails(Order? order){
  return  Padding(
            padding:const EdgeInsets.only(top: 30,left: 140),
            child: Container(
              width: 900,
               decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                    border: Border.all(
                color: Colors.black54, // Border color
                width: 1.0, // Border width
              ),
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Padding(
              padding:  EdgeInsets.only(top: 10,left: 10),
              child: Text("Payment Details",style: TextStyle(color: Colors.black87,fontSize: 17,fontWeight: FontWeight.w600),
              ),
               ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text("Payment Method:        ${order?.paymentMethod ?? "N/A"}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text("Discount:        ${order?.couponCode?.discountAmount ?? "N/A"}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text("Sub-Total:       ${order?.orderTotal?.subtotal ?? "N/A"}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text("Total:               ${order?.orderTotal?.total ?? "N/A"}",
            style: const TextStyle(color: Colors.black54, fontSize: 17,fontWeight: FontWeight.w600)),
      ),
                  ],
                ),
            ),
             );
  
}