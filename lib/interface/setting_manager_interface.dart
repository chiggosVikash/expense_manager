
import 'package:expense_manager/enums/setting_enum.dart';

abstract class SettingManagerInterface{

  void addCategory(String category);

  void addSubCategory(String subCategory);

  void saveSetting({required SettingEnum settingType, required String value});

  List<String> getSetting({required SettingEnum settingType});

}