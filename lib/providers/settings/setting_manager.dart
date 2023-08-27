

import 'package:expense_manager/databases/query/setting_ldb_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/setting_model.dart';
part 'setting_manager.g.dart';

/// A class representing the SettingManager, providing methods to retrieve setting information.
///
/// This class extends the generated base class [_$SettingManager] and includes methods
/// from the [SettingLDBQuery] mixin. It manages settings related to a specific type and
/// search key by providing a [getSetting] method. The settings are fetched using the
/// [getSettingQuery] method and the state is updated accordingly.
@riverpod
class SettingManager extends _$SettingManager with SettingLDBQuery {

  /// Builds and returns an initial empty list of settings.
  ///
  /// This method overrides the [build] method defined in the base class.
  /// It returns an empty list of [SettingModel] instances to initialize the list.
  ///
  /// Returns an empty list of [SettingModel] instances.
  @override
  List<SettingModel> build() {
    return [];
  }

  /// Retrieves and updates the state with a specific setting.
  ///
  /// This method fetches the setting information using the [getSettingQuery] method,
  /// based on the provided [settingType] and [searchKey]. The state is updated with
  /// the fetched setting information.
  ///
  /// Parameters:
  /// - [settingType]: The type of setting to retrieve.
  /// - [searchKey]: The key to search for within the setting.
  void getSetting({required String settingType, required String searchKey}) {
    state = getSettingQuery(settingType: settingType, searchKey: searchKey);
  }

}

