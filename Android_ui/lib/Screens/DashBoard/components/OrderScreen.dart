import 'package:adminpanel/Models/order_summary_info.dart';
import 'package:adminpanel/Screens/DashBoard/components/barchart.dart';
import 'package:adminpanel/Screens/DashBoard/components/order_list_view.dart';
import 'package:adminpanel/Screens/DashBoard/order_summary_card.dart';
import 'package:adminpanel/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

class orderScreen extends StatelessWidget{

  const orderScreen({Key?key}): super(key: key);

  @override
  Widget build (BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              
                  const Padding(
                    padding: EdgeInsets.only(left: 13,top: 7),
                    child: Text("Dashboard",style: TextStyle(fontSize: 33,fontWeight: FontWeight.w700,color: Colors.black54),
                    ),
                     ),
                 const SizedBox(
                  height: 20,
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    )
                    ,
                    orderSummaryCard(info: orderSummaryInfo(ordersCount: 13,title: "All Orders",percentage: 100)),
              const SizedBox(
                  height: 20,
                  width: 27,
                 ),
                 
              orderSummaryCard(info: orderSummaryInfo(ordersCount: 5,title: "Pending Orders",percentage: 40)),
              const SizedBox(
                  height: 20,
                  width: 27,
                 ),
                 
              orderSummaryCard(info: orderSummaryInfo(ordersCount: 3,title: "processed Orders",percentage: 20)),
              const SizedBox(
                  height: 20,
                  width: 27,
                 ),
                 
              orderSummaryCard(info: orderSummaryInfo(ordersCount: 5,title: "Shipped Orders",percentage: 40)),
             
                  ],
                 ),
          SizedBox(
            height: 30
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Selected Orders",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black54,fontSize: 17),),
              ),
              SizedBox(
                width: 533,
              ),
              SizedBox(
                width: 170,
                height: 67,
                child: CustomDropdown<String>(
                  initialvalue: "All Orders",
                   hintText: "Filter order by Status",
                    list: ["All Orders","Pending","Processing","Shipped"],
                   onchanged: (newValue){
                     if (newValue?.toLowerCase() == 'all orders') {
                          //TODO: should complete call filterOrders
                       } else {
                          //TODO: should complete call filterOrders
                        }
                   },
                     validator: (value) {
                      if (value == null) {
                        return 'Please select status';
                      }
                      return null;
                    },
                    displayItem: (val)=> val, ),
              )
            ],
          ) ,
          OrderList()      
             
          ],
        ),
         const SizedBox(
                width: 54,
              ),
              Container(
                width: 30,
                height:700,
                color: Colors.white,
              ),
         
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const SizedBox(
                height:5,
            ),
            const Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 SizedBox(
                width:5,
            ),
                Text("Customer views",style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.w600),),
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 300, // Set a specific height
                width: 320,
                child: barChart(),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Container(
                width: 317,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.orange!.withOpacity(0.1),
                        child: Icon(Icons.trending_up_outlined,color: Colors.orange[600],),
                      ),
                    ),
                      const SizedBox(
                        width: 25,
                      ),
                    const Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Text("Revenue",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w500),),
                        Text("Rs. 120K",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ],
    );
  }
}