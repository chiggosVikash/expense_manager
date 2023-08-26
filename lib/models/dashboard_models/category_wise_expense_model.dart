

class CategoryWiseExpenseModel{
  String category;
  double amount;

  CategoryWiseExpenseModel({required this.category,required this.amount});

  @override
  bool operator ==(covariant CategoryWiseExpenseModel other) {
    return other.category == category;
  }

  @override
  int get hashCode => category.hashCode;
}