

import 'package:objectbox/objectbox.dart';


@Entity()
class SettingModel{

  int id = 0;
  String type;
  String name;

  SettingModel({required this.type,required this.name});


}