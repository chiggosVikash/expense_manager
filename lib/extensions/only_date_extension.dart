
import 'package:expense_manager/extensions/remove_Z_from_time.dart';
import 'package:intl/intl.dart';

extension GetDateExt on DateTime{

  /// Returns the formatted date in the format "yyyy-MM-dd".
  ///
  /// Example:
  /// ```
  /// final today = DateTime.now();
  /// print(today.getDate); // Output: "2023-08-02"
  /// ```
  String get getDate{
    final format = DateTime.utc(DateTime.now().year,DateTime.now().month,DateTime.now().day).toIso8601String().removeZFromDate;
    return format;
  }

  /// Returns the current date in the format "yyyy-MM-dd".
  ///
  String get todayDate{
    var day = DateTime.now().day.toString();
    day = day.length == 1 ? "0$day":day;

    var month = DateTime.now().month.toString();
    month = month.length == 1 ? "0$month" : month;
    final date = "${DateTime.now().year}-$month-$day";
    return date;
  }

  /// Returns tomorrow's date in the format "yyyy-MM-dd".
  ///
  String get tomorrow {
    var day = (DateTime.now().day + 1).toString();
    day = day.length == 1 ? "0$day":day;


    var month = DateTime.now().month.toString();
    month = month.length == 1 ? "0$month" : month;
    final date = "${DateTime.now().year}-$month-$day";
    return date;
  }


  /// Returns the current month number (1 to 12).
  int get currentMonthNum{
    return DateTime.now().month;
  }

  /// Returns the current academic session in the format "yyyy-yyyy".
  ///
  /// The academic session is determined based on the month of the current date. If the current month is
  /// greater than or equal to April, the academic session will be in the format "yyyy-yyyy", representing
  /// the current year and the next year. Otherwise, it will be the previous academic session.
  ///
  String get currentSession{
    if(DateTime.now().month >= 4){
      final currentYear = DateTime.now().year ;
      final nextYear = DateTime.now().year + 1;
      return "$currentYear-$nextYear";
    }else{
      return previousSession;
    }

  }

  /// Returns the previous academic session in the format "yyyy-yyyy".
  ///
  /// The previous academic session is determined based on the current year. It represents the academic
  /// session that has already ended, which is one year before the current academic session.
  ///
  String get previousSession{
    final previousYear = DateTime.now().year-1;
    final currentYear = DateTime.now().year;
    return "$previousYear-$currentYear";
  }

  /// Returns the abbreviated month name (e.g., "Jan", "Feb", etc.) from the DateTime.
  ///
  /// Example:
  /// ```
  /// final monthName = DateTime.now().dateMonth;
  /// print(monthName); // Output: "Aug"
  /// ``
  String get dateMonth{
    final month = DateFormat("MMM").format(this);
    return month;
  }

}