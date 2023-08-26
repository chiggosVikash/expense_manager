
import 'package:expense_manager/databases/setup/objectbox_storage.dart';
import 'package:expense_manager/models/setting_model.dart';
import 'package:expense_manager/objectbox.g.dart';

mixin class SettingLDBQuery{

  SettingLDBQuery._();

  void addNewSetting(SettingModel settingData){
    ObjectBoxStore().settingBox.put(settingData);
  }

  List<SettingModel> getSettingQuery({required String settingType,required String searchKey}){
    final queryBuilder = ObjectBoxStore().settingBox.query(
        SettingModel_.type.equals(settingType)
            .and(SettingModel_.name.contains(searchKey),
        ),
    ).build();
    final settings = queryBuilder.find();
    queryBuilder.close();
    return settings;
  }





}