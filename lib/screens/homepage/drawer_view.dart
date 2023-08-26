import 'package:expense_manager/dialogs/theme_change_dialog.dart';
import 'package:expense_manager/providers/drawer_navigation_manager/drawer_navigation_manager.dart';
import 'package:expense_manager/screens/view_expenses/view_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../add_expense_screen/add_expense_screen.dart';


/// A widget representing the navigation drawer for the application.
///
/// This widget is a `ConsumerWidget` that builds the navigation drawer UI. It listens to the
/// [drawerNavigationManagerProvider] to determine the selected index of the menu items. It
/// provides a way to change the active menu item and perform corresponding actions when a menu
/// item is selected.
class DrawerView extends ConsumerWidget {
  /// Constructs a new [DrawerView] instance.
  const DrawerView({
    Key? key,
  }) : super(key: key);

  /// Builds the navigation drawer UI.
  ///
  /// This method creates a [NavigationDrawer] widget and populates it with a list of
  /// [NavigationDrawerDestination] items. Each item is associated with an icon and label and
  /// corresponds to a different page or action within the app.
  ///
  /// The [onDestinationSelected] callback is triggered when a menu item is selected, allowing
  /// navigation and state changes.
  ///
  /// Returns the built widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(drawerNavigationManagerProvider);

    return NavigationDrawer(
      onDestinationSelected: (index) {
        ref.read(drawerNavigationManagerProvider.notifier).changeMenuSelection(index);

        /// Delayed navigation based on selected menu item
        Future.delayed(const Duration(milliseconds: 120)).then((value) {
          switch (index) {
            case 0:
              Navigator.pop(context);
              break;
            case 1:
              Navigator.pushNamed(context, AddExpenseScreen.routeAddress);
              break;
            case 2:
              Navigator.pushNamed(context, ViewExpensesScreen.routeAddress);
              break;
            case 3:
              _showThemeChangeDialogue(context);
              break;
            default:
              break;
          }
        });
      },
      selectedIndex: selectedIndex,
      children: const [
        NavigationDrawerDestination(
          icon: Icon(Icons.home),
          label: Text("Homepage"),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.monetization_on),
          label: Text("Add Expense"),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.monetization_on),
          label: Text("View Expenses"),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.sunny),
          label: Text("Change Theme"),
        ),
      ],
    );
  }

  void _showThemeChangeDialogue(BuildContext context){
    showDialog(context: context, builder: (context){
     return ShowThemeChangeDialog();
    });
  }
}
