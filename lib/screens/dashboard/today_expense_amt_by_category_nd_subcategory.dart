import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:expense_manager/models/dashboard_models/category_wise_expense_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayExpenseAmtByCategoryNdSubcategory extends StatelessWidget {
  final List<CategoryWiseExpenseModel> _todayExpenses;
  const TodayExpenseAmtByCategoryNdSubcategory({super.key,required List<CategoryWiseExpenseModel> todayExpenses})
  :_todayExpenses = todayExpenses;


  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.005),
        child: Text("Today's Expense amount (\u20B9)",style: GoogleFonts.openSans(
          fontSize: ((context.height+context.width)*context.aspectRatio)*.028
        ),),
      ),
     Container(
       margin: EdgeInsets.symmetric(horizontal: context.width*.02),
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
           color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(.4)),
       child: Row(children: [
        Container(height: context.height*.05,
         width:context.width*.95/2 ,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(30),
             color: Theme.of(context).colorScheme.secondaryContainer),
         child: LayoutBuilder(
           builder: (context,constraints) {
             return Center(child: Text("Category",
               style: GoogleFonts.bodoniModa(
                 fontWeight: FontWeight.w500,
                 fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.15
               ),));
           }
         ),),
         Container(height: context.height*.05,
           width:context.width*.95/2 ,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(30),
             color: Colors.transparent
           ),
           child: LayoutBuilder(
             builder: (context,constraints) {
               return Center(child: Text("Subcategory",
                 style: GoogleFonts.bodoniModa(
                   fontWeight: FontWeight.w500,
                   fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.15
               ),));
             }
           ),)

       ],),),
     SizedBox(height: context.height*.02,),

     Container(
       margin: EdgeInsets.symmetric(horizontal: context.height*.02),
       child: SingleChildScrollView(scrollDirection: Axis.horizontal,
         child: Wrap(spacing: context.width*.03,
           children: List.generate(_todayExpenses.length, (index) {
           return Container(width: context.width*.95/3,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               gradient: SweepGradient(
                 stops: const [.3,.5,.8],
                   colors: [
                 Theme.of(context).colorScheme.secondaryContainer.withOpacity(.7),
                 Colors.blue.withOpacity(.08),
                 Colors.indigo.withOpacity(.2)
               ])
             ),
             child: Container(
               padding: EdgeInsets.symmetric(vertical: context.height*.005,horizontal: context.width*.02),
               margin: EdgeInsets.symmetric(horizontal: context.width*.008,vertical: context.height*.003),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   color: Theme.of(context).canvasColor
               ),

               child: LayoutBuilder(
                 builder: (context,constraints) {
                   return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                     Text.rich(TextSpan(children: [
                       const TextSpan(text: "\u20B9 "),
                       TextSpan(text: "${_todayExpenses[index].amount}")
                     ])),
                     Text(_todayExpenses[index].category),

                   ],);
                 }
               ),
             ),
           );
         }),),
       ),
     )







    ],);
  }
}
