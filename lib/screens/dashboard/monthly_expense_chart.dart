import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/dashboard_models/monthly_expense_model.dart';
import 'model.dart';

class MonthlyExpenseChart extends StatelessWidget {
  final List<MonthlyExpenseModel> monthlyExpenseData;
  const MonthlyExpenseChart({super.key,required this.monthlyExpenseData});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.005),
        child: Text("Monthly Expense (\u20B9)",style: GoogleFonts.openSans(
            fontSize: ((context.height+context.width)*context.aspectRatio)*.028
        ),),
      ),
      Container(height: context.height*.27,
        margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.01),
        child: SfCartesianChart(
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: CategoryAxis(labelRotation: -20,
              labelStyle: GoogleFonts.poppins(
                  fontSize: ((context.height+context.width)*context.aspectRatio)*.015
              )
          ),
          series: [
            ColumnSeries(
                width: .5,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                gradient: LinearGradient(
                  // stops: [.3,.7,.9],
                  begin: Alignment.bottomCenter,end: Alignment.topCenter,
                    colors: [
                  Theme.of(context).colorScheme.secondaryContainer.withOpacity(.2),
                  Theme.of(context).colorScheme.surfaceTint.withOpacity(.15),
                  Theme.of(context).colorScheme.surfaceTint.withOpacity(.3)
                ]),
                enableTooltip: true,
                markerSettings: const  MarkerSettings(isVisible: true,width: 5,height: 5,shape: DataMarkerType.diamond),
                dataSource: monthlyExpenseData ,
                xValueMapper: (MonthlyExpenseModel val,_) => val.month,
                yValueMapper: (MonthlyExpenseModel val,_) => val.amount),
            // LineSeries(
            //     markerSettings: const  MarkerSettings(isVisible: true,width: 5,height: 5,shape: DataMarkerType.circle),
            //     dataSource: monthlyDuesNdBillingAmtData ,
            //     xValueMapper: (MonthlyDuesNdBillingAmtModel val,_) => val.month,
            //     yValueMapper: (MonthlyDuesNdBillingAmtModel val,_) => val.duesAmt)

          ],),),




    ],);
  }
}
