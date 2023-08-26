import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/dashboard_models/yearly_expense_model.dart';

class YearlyExpenseChart extends StatelessWidget {
  final List<YearlyExpenseModel> yearlyExpenseData;
  const YearlyExpenseChart({super.key,required this.yearlyExpenseData});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.005),
        child: Text("Yearly Expense (\u20B9)",style: GoogleFonts.openSans(
            fontSize: ((context.height+context.width)*context.aspectRatio)*.028
        ),),
      ),
      SizedBox(height: context.height*.25,
        child: SfCircularChart(
          legend: const Legend(isResponsive: true,isVisible: true),
          series: [
            PieSeries<YearlyExpenseModel,String>(
                dataSource: yearlyExpenseData,
                startAngle: 240,
                endAngle: 125,
                dataLabelMapper: (YearlyExpenseModel val,_) => "${val.expenseAmount}\n(${val.year})",
                dataLabelSettings:  DataLabelSettings(isVisible: true,color: Theme.of(context).colorScheme.onSecondary),
                pointShaderMapper: (YearlyExpenseModel val,_,Color color,Rect rect) => val.shader,
                xValueMapper: (YearlyExpenseModel val,_) => val.year,
                yValueMapper: (YearlyExpenseModel val,_) => val.expenseAmount
            )
          ],),)




    ],);
  }
}
