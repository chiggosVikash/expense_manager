

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'drawer_navigation_manager.g.dart';

/// A provider for managing the navigation state of a drawer menu.
///
/// This class extends [StateNotifier] from the `flutter_riverpod` package and serves as a
/// navigation state manager for a drawer menu. It provides a method `changeMenuSelection`
/// to update the currently selected menu index, effectively changing the active menu item.
@riverpod
class DrawerNavigationManager extends _$DrawerNavigationManager {
  /// Constructs a new [DrawerNavigationManager] instance.
  DrawerNavigationManager() : super();

  /// Placeholder method for building the state.
  ///
  /// This method is intended to fulfill the required abstract method from the extended class.
  /// It returns a value of 0 as a placeholder.
  @override
  int build() {
    return 0;
  }

  /// Updates the currently selected menu index.
  ///
  /// This method allows changing the state to the provided [menuIndex], effectively indicating
  /// the active menu item. The state change triggers UI updates to reflect the selected menu item.
  void changeMenuSelection(int menuIndex) {
    state = menuIndex;
  }
}
