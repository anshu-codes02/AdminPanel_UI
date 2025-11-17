import 'package:adminpanel/Models/order_summary_info.dart';
import 'package:flutter/material.dart';

class orderSummaryCard extends StatelessWidget{

     orderSummaryCard({Key?key,required this.info}):super(key: key);
    
    orderSummaryInfo info;
    @override
    Widget build(BuildContext context)
    {
        return Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Container(
              height:142,
              width: 175,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           
                           Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                          padding: const EdgeInsets.all(4),
                          height: 40,
                          width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: info.color!.withOpacity(0.2)
                        ),
                        child: Icon(Icons.local_shipping,color: info.color,),
                       ),
                     ),
                     const Padding(
                       padding:  EdgeInsets.only(right: 7),
                       child:  Icon(Icons.more_vert,color: Colors.black54,),
                     )
          
                          ],
                      ),
                     
              const SizedBox(
                      height: 4,
                     ),
               Padding(
                 padding: const EdgeInsets.only(left: 7,top: 4),
                 child: Text(
                  info.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600),
                 ),
                ),
                const SizedBox(
                    height: 14,
                ),
                progressLine(percentage: info.percentage),
                Padding(
                    padding: EdgeInsets.only(top:4,left:7),
                    child: Text("${info.ordersCount} orders",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600)) )
                  ],
              ),
          ),
        );

    }

}

class progressLine extends StatelessWidget{

    const progressLine({Key? key,required this.percentage,}) : super(key: key);

  final double? percentage;

  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Stack(
        children: [Container(
            width: 163,
            height: 7,
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
             color: Color.fromARGB(255, 230, 105, 3)!.withOpacity(0.1) ),
        ),
        Container(
            width: 163 *(percentage!/100),
            height: 7,
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
             color: Color.fromARGB(255, 230, 105, 3) ),
        ),

        ]
      ),
    );
  }
}
