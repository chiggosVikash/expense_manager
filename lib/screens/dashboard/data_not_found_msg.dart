import 'package:expense_manager/extensions/media_query_extension.dart';
import 'package:expense_manager/providers/dashboard_manager/dashboard_manager.dart';
import 'package:expense_manager/screens/add_expense_screen/add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DataNotFound extends ConsumerWidget {
  const DataNotFound({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: context.width*.03,
          ),
          height: context.height*.4,width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient:LinearGradient(colors: [
              Colors.blue.withOpacity(.1),
              Colors.deepOrange.withOpacity(.1)
            ])
          ),
          child: LayoutBuilder(
            builder: (context,constraints) {
              return Stack(
                children: [
                  Positioned(
                      left: (constraints.biggest.width-(constraints.biggest.width*.4))/2,
                      top: (constraints.biggest.height-(constraints.biggest.height*.4))/2,
                      child: Opacity(opacity: .3,
                          child: Icon(Icons.hourglass_empty,size: constraints.biggest.height*.4,))),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: constraints.biggest.width*.04,vertical: constraints.biggest.height*.03),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      SizedBox(height: constraints.biggest.height*.06,),

                      Center(child: Text("Let's Add",style: GoogleFonts.abyssinicaSil(
                        fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.11
                      ),)),
                      SizedBox(height: constraints.biggest.height*.06,),

                      const Text("You haven't added any expenses yet. Please add & track your expenses :) "),
                      SizedBox(height: constraints.biggest.height*.1,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                        FilledButton(onPressed: (){
                          Navigator.pushNamed(context, AddExpenseScreen.routeAddress);
                        }, child: const  Text("Add Expense")),
                        SizedBox(width: context.width*.07,),
                        FilledButton.tonalIcon(icon: const Icon(Icons.refresh),
                            onPressed: (){
                              ref.read(dashboardManagerProvider.notifier).refreshPage();
                            },
                            label: const Text("Refresh"))
                      ],)
                      

                    ],),
                  )
                ],
              );
            }
          )),
    ],);
  }
}
