

import 'package:expense_manager/databases/query/setting_ldb_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/setting_model.dart';
part 'setting_manager.g.dart';
@riverpod
class SettingManager extends _$SettingManager with SettingLDBQuery{

  @override
  List<SettingModel> build(){
    return [];
  }

  void getSetting({required String settingType,required String searchKey}){
    state = getSettingQuery(settingType: settingType, searchKey: searchKey);
  }

}
