import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'amt_widget.dart';

class TopThreeExpenseCategory extends StatelessWidget {
  const TopThreeExpenseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.005),
        child: Text("Top three Expense Category",style: GoogleFonts.openSans(
            fontSize: ((context.height+context.width)*context.aspectRatio)*.027
        ),),
      ),

      Column(children: List.generate(3, (index) {
        return Container(width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(colors: [
              Colors.blue.withOpacity(.1),
              Colors.brown.withOpacity(.2)
            ])
          ),
          margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.002),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.007),
            margin: EdgeInsets.only(top: context.height*.004,left: context.width*.01),
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(20)
            ),
            child: LayoutBuilder(
              builder: (context,constraints) {
                return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.category_rounded,size: constraints.biggest.width*.03,color: Theme.of(context).colorScheme.surfaceTint,),
                    SizedBox(width: constraints.biggest.width*.95,
                        child: Text("Category Name",style: GoogleFonts.aBeeZee(
                          fontSize: ((constraints.biggest.width+context.height)*context.aspectRatio)*.027
                        ),)),
                  ],
                ),
                  ExpenseAmtWidget(constraints: constraints)
                  
                          ],);
              }
            ),
          ),);
      }),)


    ],);
  }
}
