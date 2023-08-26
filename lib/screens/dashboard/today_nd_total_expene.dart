import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper_widgets/totalcount_card.dart';

class TodayNdTotalExpenseAmt extends StatelessWidget {
  const TodayNdTotalExpenseAmt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.005),
        child: Text("Today & Total Expense (\u20B9)",style: GoogleFonts.openSans(
            fontSize: ((context.height+context.width)*context.aspectRatio)*.028
        ),),
      ),
      SizedBox(height: context.height*.01,),
      Container(
        margin: EdgeInsets.symmetric(horizontal: context.width*.04),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          TotalCountCard(width: context.width*.4,titleText: "Running Month",
            labelText: "(Aug) Expense", totalcount: "10.0 K", icon: Icon(Icons.currency_rupee_rounded,size: context.height*.02,)),
          TotalCountCard(width: context.width*.4,titleText: "Expense",
              labelText: "Today", totalcount: "2.0 K", icon: Icon(Icons.currency_rupee_rounded,size: context.height*.02,))
        ],),
      )

    ],);
  }
}
