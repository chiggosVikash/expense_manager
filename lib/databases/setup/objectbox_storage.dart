import 'package:expense_manager/models/expense_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../../models/setting_model.dart';
import '../../objectbox.g.dart';

class ObjectBoxStore{
  static final instance = ObjectBoxStore._internal();

  ObjectBoxStore._internal();
  factory ObjectBoxStore(){
    return instance;
  }

  Store? _store;
  late Box<ExpenseModel> expenseBox;
  late Box<SettingModel> settingBox;

  Future<void> create()async{
    if(_store == null ){
      await getApplicationDocumentsDirectory().then((value){
        _store = Store(getObjectBoxModel(),directory:path.join(value.path,"objectbox") );
        expenseBox = Box<ExpenseModel>(_store!);
        settingBox = Box<SettingModel>(_store!);
      });
    }

  }

}