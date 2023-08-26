// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_navigation_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$drawerNavigationManagerHash() =>
    r'464439f7b41b3c430281849fed6e0c1fb0aa31db';

/// A provider for managing the navigation state of a drawer menu.
///
/// This class extends [StateNotifier] from the `flutter_riverpod` package and serves as a
/// navigation state manager for a drawer menu. It provides a method `changeMenuSelection`
/// to update the currently selected menu index, effectively changing the active menu item.
///
/// Copied from [DrawerNavigationManager].
@ProviderFor(DrawerNavigationManager)
final drawerNavigationManagerProvider =
    AutoDisposeNotifierProvider<DrawerNavigationManager, int>.internal(
  DrawerNavigationManager.new,
  name: r'drawerNavigationManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$drawerNavigationManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DrawerNavigationManager = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
