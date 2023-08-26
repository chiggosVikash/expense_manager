import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalCountCard extends StatelessWidget {
  final String titleText;
  final String labelText;
  final String totalcount;
  final Widget icon;
  final double width;
  const TotalCountCard({super.key,required this.width ,this.titleText = "Total",required this.labelText,required this.totalcount,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(width:width,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer,width: 4),
          color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(context.width*.05)
      ),
      padding: EdgeInsets.symmetric(vertical: context.height*.006,horizontal: context.width*.02),
      child:LayoutBuilder(
          builder: (context,constraints) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              SizedBox(width: constraints.biggest.width*.75,
                  child: Text(titleText,style: GoogleFonts.alike(
                      fontSize: ((context.height+constraints.biggest.width)*context.aspectRatio)*.023,
                      color: Theme.of(context).textTheme.bodySmall!.color),)),
              Text(labelText,style: GoogleFonts.libreBaskerville(
                  fontSize: ((context.height+constraints.biggest.width)*context.aspectRatio)*.032
              ),),
              SizedBox(height: context.height*.01,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                icon,
                SizedBox(width: constraints.biggest.width*.8,
                    child: Text(totalcount,style: GoogleFonts.alike(
                        fontSize: ((context.height+constraints.biggest.width)*context.aspectRatio)*.037
                    ),)),


              ],)

            ],);
          }
      ) ,);

  }
}