
import 'dart:ui';
import 'package:expense_manager/enums/setting_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'custom_widget_pos_provider.g.dart';
@riverpod
class CustomWidgetPosP extends _$CustomWidgetPosP{

  @override
  (SettingEnum,Offset) build(){
    return (SettingEnum.none,const Offset(0, 0));
  }

  void findPos({required GlobalKey globalKey,required SettingEnum type}){
    final renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
    final pos = renderBox.localToGlobal(Offset.zero);
    state = (type,pos);
    if (kDebugMode) {
      print(pos);
    }

  }

  void resetPosToZero(){
    state = (SettingEnum.none,Offset.zero);
  }
}