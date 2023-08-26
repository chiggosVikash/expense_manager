import 'package:expense_manager/extensions/size_extension.dart';
import 'package:expense_manager/providers/custom_widget_pos_provider/custom_widget_pos_provider.dart';
import 'package:expense_manager/providers/expense_manager/expense_manager.dart';
import 'package:expense_manager/providers/settings/setting_manager.dart';
import 'package:expense_manager/screens/add_expense_screen/bill_image_view.dart';
import 'package:expense_manager/screens/add_expense_screen/save_button.dart';
import 'package:expense_manager/screens/add_expense_screen/search_view.dart';
import 'package:expense_manager/screens/process_handler/process_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/action_enum.dart';
import '../../enums/setting_enum.dart';
import '../view_expenses/view_expenses.dart';

/// A screen widget for adding new expenses.
///
/// This screen provides a form to input various details of a new expense, such as category,
/// subcategory, date, amount, notes, bill number, and expense by. It utilizes several
/// [TextFormField] widgets for user input, a [BillImageView] widget for bill image upload, and a
/// [SaveExpenseButton] widget for saving the expense.
///
class AddExpenseScreen extends ConsumerStatefulWidget {
  static const routeAddress = "/addExpenseScreen";
  const AddExpenseScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends ConsumerState<AddExpenseScreen> {
  final double _opacity = 0.3;
  final double _spacerHeight = 0.03;

  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  final _billNoController = TextEditingController();
  final _expenseByController = TextEditingController();
  final _subCategoryController = TextEditingController();

  final _categoryGlobalKey = GlobalKey();
  final _subCategoryGlobalKey = GlobalKey();


  @override
  void dispose() {
    _categoryController.dispose();
    _dateController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    _billNoController.dispose();
    _expenseByController.dispose();
    _subCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context,) {

    return Scaffold(
      appBar: AppBar(title: const Text("Add Expense"),),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.02),
                margin: EdgeInsets.symmetric(horizontal: context.width*.02,),
                child: Form(
                  child: Column(children: [
                    TextFormField(

                      onTap: (){
                        ref.read(customWidgetPosPProvider.notifier).findPos(globalKey: _categoryGlobalKey,type: SettingEnum.category);
                      },
                     onChanged: (data){
                       ref.read(customWidgetPosPProvider.notifier).findPos(globalKey: _categoryGlobalKey,type: SettingEnum.category);
                       ref.read(settingManagerProvider.notifier).getSetting(settingType: SettingEnum.category.name,
                           searchKey: data);
                     },
                      onEditingComplete: (){
                        ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                      },
                      onFieldSubmitted: (_){
                        ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                      },
                      key: _categoryGlobalKey,
                      controller: _categoryController,
                      decoration: InputDecoration(
                          labelText: "Category",
                          isDense:true,
                          border:InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer
                              .withOpacity(_opacity)
                      ),
                    ),

                    SizedBox(height: context.height*_spacerHeight,),

                    TextFormField(
                      key: _subCategoryGlobalKey,
                      controller: _subCategoryController,
                      onEditingComplete: (){
                        ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                      },
                      onTap: (){
                        ref.read(customWidgetPosPProvider.notifier).findPos(globalKey: _subCategoryGlobalKey,type: SettingEnum.subCategory);
                      },
                      onChanged: (data){
                        ref.read(customWidgetPosPProvider.notifier).findPos(globalKey: _subCategoryGlobalKey,type: SettingEnum.subCategory);
                        ref.read(settingManagerProvider.notifier).getSetting(settingType: SettingEnum.subCategory.name,
                            searchKey: data);
                      },
                      onFieldSubmitted: (_){
                        ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                      },
                      decoration: InputDecoration(
                          labelText: "Sub Category",
                          isDense:true,
                          border:InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer
                              .withOpacity(_opacity)
                      ),
                    ),

                    SizedBox(height: context.height*_spacerHeight,),
                    TextFormField(
                      onTap: (){
                        _datePickerDialog();
                      },
                      readOnly: true,
                      controller: _dateController,
                      decoration: InputDecoration(
                          labelText: "Date",
                          isDense:true,
                          border:InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer
                              .withOpacity(_opacity)
                      ),
                    ),
                    SizedBox(height: context.height *_spacerHeight,),
                    TextFormField(
                      controller: _amountController,
                      decoration: InputDecoration(
                          labelText: "Amount",
                          isDense:true,
                          border:InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer
                              .withOpacity(_opacity)
                      ),
                      onTap: (){
                        ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                      },
                    ),

                    SizedBox(height: context.height *_spacerHeight,),
                    TextFormField(
                      controller: _noteController,
                      minLines: 3,
                      maxLines: 4,
                      decoration: InputDecoration(
                          labelText: "Notes",
                          isDense:true,
                          border:InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer
                              .withOpacity(_opacity)
                      ),
                      onTap: (){
                        ref.read(customWidgetPosPProvider.notifier).resetPosToZero();
                      },
                    ),

                    SizedBox(height: context.height *_spacerHeight,),
                    TextFormField(
                      controller: _billNoController,
                      decoration: InputDecoration(
                          labelText: "Bill no",
                          isDense:true,
                          border:InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer
                              .withOpacity(_opacity)
                      ),
                    ),

                    SizedBox(height: context.height *_spacerHeight,),
                    TextFormField(
                      controller: _expenseByController,
                      decoration: InputDecoration(
                          labelText: "Expense By",
                          isDense:true,
                          border:InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer
                              .withOpacity(_opacity)
                      ),
                    ),
                    SizedBox(height:context.height*_spacerHeight ,),

                    // const BillImageView(),
                    // SizedBox(height:context.height*_spacerHeight ,),

                    SaveExpenseButton(onSave:(){

                      ref.read(expenseManagerProvider.notifier).addExpense(
                          category: _categoryController.text,
                          subCategory: _subCategoryController.text,
                          date: _dateController.text,
                          amount: _amountController.text,
                          note: _noteController.text,
                          expenseBy: _expenseByController.text);
                      Navigator.pushNamed(context, ProcessHandler.routeAddress,
                          arguments: ProcessHandlerArgs(
                              failedAction: (){},
                              successAction: (){
                                _clearTextFieldControllers();
                                Navigator.pushNamed(context, ViewExpensesScreen.routeAddress);
                              }, action: ActionEnum.addExpense,
                              successButtonTitle: "View Expenses"));
                    } ,)
                  ],),
                ),
              ),


            ],),

         SearchView(categoryController: _categoryController,
             subCategoryController: _subCategoryController)
        ],
      ),
    );
  }
  Future<void> _datePickerDialog()async{
    final pickedDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 5), lastDate: DateTime.now());

    if(pickedDate != null){
      _dateController.text = pickedDate.toIso8601String();
    }
  }

  void _clearTextFieldControllers(){
    _subCategoryController.text = "";
    _categoryController.text = "";
    _noteController.text = "";
    _dateController.text = "";
    _amountController.text = "";
    _expenseByController.text = "";
  }
}

