import 'dart:ui';
import 'package:expense_manager/enums/setting_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_widget_pos_provider.g.dart';

/// A provider for managing the position of custom widgets based on their types.
@riverpod
class CustomWidgetPosP extends _$CustomWidgetPosP {
  /// Initializes the provider with a default position.
  @override
  (SettingEnum, Offset) build() {
    return (SettingEnum.none, const Offset(0, 0));
  }

  /// Finds and updates the position of a custom widget based on its type.
  ///
  /// This method takes a [globalKey] of the widget and [type] of the widget.
  /// It calculates the global position of the widget using [RenderBox] and updates the state
  /// with the widget's type and position.
  void findPos({required GlobalKey globalKey, required SettingEnum type}) {
    final renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
    final pos = renderBox.localToGlobal(Offset.zero);
    state = (type, pos);

    // Print the position if in debug mode
    if (kDebugMode) {
      print(pos);
    }
  }

  /// Resets the widget's position to the default values.
  void resetPosToZero() {
    state = (SettingEnum.none, Offset.zero);
  }
}
