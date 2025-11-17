import 'package:adminpanel/Screens/MainScreen/main_screen_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class barChart extends StatelessWidget{


  
 Widget build(BuildContext context)
 {
  return Consumer<MainScreenProvider>(builder: (context,provider,child){
      if (provider.dates.isEmpty || provider.views.isEmpty) {
          return const Center(
            child: Text(
              'No data available',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

     return BarChart(
    BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: 35,
      barTouchData: BarTouchData(enabled: false),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            getTitlesWidget:(value, meta) {
              if(value%5==0)
              {
                return Text(value.toInt().toString(),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold)
                              );
              }
              return Container(); // Hide other values
            },
            // interval: 1, 
          )
        ),
      bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    if (index >= 0 && index < provider.dates.length) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Transform.rotate(
                          angle: -1.57 ,// - 90 degree,
                          child: Text(
                            provider.dates[index],
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                  //interval: 5,
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(show: true),
            borderData: FlBorderData(show: false),
            barGroups: provider.views.asMap().entries.map((entry) {
              final index = entry.key;
              final value = entry.value;
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: value.toDouble(),
                    color: Colors.orange,
                    width: 20,
                    borderRadius: BorderRadius.circular(5),
                  )
                ],
              );
            }).toList(),
    )
    );
  });
 
 }
}