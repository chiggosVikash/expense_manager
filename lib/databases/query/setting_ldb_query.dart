
import 'package:expense_manager/databases/setup/objectbox_storage.dart';
import 'package:expense_manager/extensions/string_extension.dart';
import 'package:expense_manager/models/setting_model.dart';
import 'package:expense_manager/objectbox.g.dart';

mixin class SettingLDBQuery{

  SettingLDBQuery._();

  void addNewSetting(SettingModel settingData){
    final queryBuilder = ObjectBoxStore().settingBox.query(SettingModel_.name.equals(settingData.name).and(
        SettingModel_.type.equals(settingData.type))).build();
    final ids = queryBuilder.property(SettingModel_.name).find();
    queryBuilder.close();
    if(ids.isEmpty){
      ObjectBoxStore().settingBox.put(settingData);
    }

  }

  List<SettingModel> getSettingQuery({required String settingType,required String searchKey}){
    final queryBuilder = ObjectBoxStore().settingBox.query(
        SettingModel_.type.equals(settingType)
            .and(SettingModel_.name.contains(searchKey.firstCharToUpper),
        ),
    ).build();
    final settings = queryBuilder.find();
    queryBuilder.close();
    return settings;
  }





}