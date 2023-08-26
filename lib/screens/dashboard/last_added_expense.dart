import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'amt_widget.dart';

class LastAddedExpense extends StatelessWidget {
  const LastAddedExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.005),
        child: Text("Last Added Expense",style: GoogleFonts.openSans(
            fontSize: ((context.height+context.width)*context.aspectRatio)*.028
        ),),
      ),

      Container(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor,
              boxShadow: [
                const BoxShadow(color: Colors.indigo,offset: Offset(-4, 0)),
                BoxShadow(color: Theme.of(context).colorScheme.surfaceVariant,blurRadius: 3,offset: const Offset(0, 2)),
              ],
              borderRadius: BorderRadius.circular(10)
          ),
          margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.01),
          padding: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.01),
          child: Row(
            children: [
              SizedBox(width: context.width*.7,
                child: LayoutBuilder(
                    builder: (context,constraints) {
                      return Container(
                        decoration: BoxDecoration(border: Border(right: BorderSide(color: Theme.of(context).colorScheme.secondaryContainer))),
                        child: Column(children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Icon(Icons.auto_mode,size: context.height*.015,color: Theme.of(context).colorScheme.surfaceTint,),
                            SizedBox(width: constraints.biggest.width*.94,child: Text("Sub-category name",
                              style: GoogleFonts.alegreyaSansSc(
                                  fontSize: ((context.height+constraints.biggest.width)*context.aspectRatio)*.032
                              ),),)
                          ],),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Icon(Icons.category_rounded,size: context.height*.015,color: Theme.of(context).colorScheme.inversePrimary,),
                            SizedBox(width: constraints.biggest.width*.94,child: Text("Category name",
                              style: GoogleFonts.abyssinicaSil(
                                  color: Theme.of(context).textTheme.bodySmall!.color,
                                  fontSize: ((context.height+constraints.biggest.width)*context.aspectRatio)*.027
                              ),),)
                          ],),
                          ExpenseAmtWidget(constraints: constraints)



                          // Row(children: [
                          // //   Container(alignment: Alignment.centerRight,
                          // //     width:constraints.biggest.width*.4,
                          // //     child: Text("House Name",style: GoogleFonts.abyssinicaSil(
                          // //         color: Theme.of(context).textTheme.bodySmall!.color
                          // //     ),),),
                          // //   SizedBox(height: context.height*.014,
                          // //     child: VerticalDivider(color: Theme.of(context).colorScheme.secondary,
                          // //       thickness: 0.9,),),
                          // //   SizedBox(
                          // //     width:constraints.biggest.width*.4,
                          // //     child: Text("VIII",style: GoogleFonts.abyssinicaSil(
                          // //         color: Theme.of(context).textTheme.bodySmall!.color
                          // //
                          // //     ),),),
                          // // ],)
                        ],),
                      );
                    }
                ),
              ),
              SizedBox(width: context.width*.2,child: LayoutBuilder(builder: (context,constraints){
                return Column(children: [
                  Text("On",style: GoogleFonts.alegreyaSansSc(
                      fontSize: ((context.height+constraints.biggest.width)*context.aspectRatio)*.025
                  ),),
                  Text("23 Apr",style: GoogleFonts.abyssinicaSil(
                      fontSize: ((context.height+constraints.biggest.width)*context.aspectRatio)*.028
                  ),),
                  Text("2023",style: GoogleFonts.abyssinicaSil(
                      color:Theme.of(context).textTheme.bodySmall!.color,
                      fontSize: ((context.height+constraints.biggest.width)*context.aspectRatio)*.025
                  ),)
                ],);
              }),)
            ],
          )
      )

    ],);
  }
}
