

import 'package:expense_manager/enums/action_enum.dart';
import 'package:expense_manager/screen_route/custom_route.dart';
import 'package:expense_manager/screens/add_expense_screen/add_expense_screen.dart';
import 'package:expense_manager/screens/process_handler/process_handler.dart';
import 'package:expense_manager/screens/splash_screen/splash_screen.dart';
import 'package:expense_manager/screens/view_expenses/view_expenses.dart';
import 'package:flutter/material.dart';

import '../screens/homepage/homepage.dart';

class ScreenRoute{

  final _pageOpenDirection = const Offset(1, 0);
  Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case "/":
        return CustomRoute(page: const Homepage(), offset: _pageOpenDirection);
      case Homepage.routeAddress:
        return CustomRoute(page: const Homepage(), offset: _pageOpenDirection);
      case AddExpenseScreen.routeAddress:
        return CustomRoute(page: const AddExpenseScreen(), offset: _pageOpenDirection);
      case ProcessHandler.routeAddress:
        final args = settings.arguments as ProcessHandlerArgs;
        return CustomRoute(page: ProcessHandler(args: args), offset: _pageOpenDirection);

      case ViewExpensesScreen.routeAddress:
        return CustomRoute(page: const ViewExpensesScreen(), offset: _pageOpenDirection);

      default:
        return CustomRoute(page: Scaffold(
          body: Center(child: Text("Page not found ${settings.name}"),),
        ), offset: _pageOpenDirection);
    }
  }
}