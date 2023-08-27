
import 'package:expense_manager/enums/setting_enum.dart';

/// An abstract class defining the interface for managing application settings.
///
/// This abstract class outlines methods for managing various application settings,
/// such as adding categories, subcategories, and saving settings. Implementing classes
/// are expected to provide these methods to handle setting-related functionality.
abstract class SettingManagerInterface {

  /// Adds a new category to the application's settings.
  ///
  /// This method allows the addition of a new [category] to the application's settings.
  /// The new category can be used for categorizing expenses or other application features.
  ///
  /// Parameter [category]: The category to be added.
  void addCategory(String category);

  /// Adds a new subcategory to the application's settings.
  ///
  /// This method allows the addition of a new [subCategory] to the application's settings.
  /// Subcategories can be used to further categorize expenses or other application features.
  ///
  /// Parameter [subCategory]: The subcategory to be added.
  void addSubCategory(String subCategory);

  /// Saves a specific setting value based on its type.
  ///
  /// This method enables the saving of a setting value using the provided [settingType]
  /// and [value]. The [settingType] indicates the type of setting to be saved, while
  /// the [value] represents the value associated with that setting.
  ///
  /// Parameters:
  /// - [settingType]: The type of setting to save.
  /// - [value]: The value to save for the specified setting.
  void saveSetting({required SettingEnum settingType, required String value});

  /// Retrieves the values associated with a specific setting type.
  ///
  /// This method retrieves a list of values associated with the specified [settingType].
  /// The values could correspond to categories, subcategories, or other settings.
  ///
  /// Parameter [settingType]: The type of setting to retrieve values for.
  ///
  /// Returns a list of strings representing the values for the specified setting type.
  List<String> getSetting({required SettingEnum settingType});

}
