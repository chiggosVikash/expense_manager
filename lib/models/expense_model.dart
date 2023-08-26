

import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';


@Entity()
class ExpenseModel{
  int id = 0;
  String category;
  String date;
  double amount;
  String subCategory;
  String? note;
  @Property(type: PropertyType.byteVector)
  Uint8List? image;
  String modelId = DateTime.now().toIso8601String();
  String? billNo;

  String expenseBy;
  ExpenseModel({required this.category,
  required this.amount,
    required this.date,
    required this.image,
    required this.expenseBy,
    required this.note,
    required this.billNo,
    required this.subCategory
  });

}