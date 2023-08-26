import 'package:intl/intl.dart';

/// The `FormatDateExtension` extension provides additional methods for formatting date and time strings.
extension FormatDateExtension on String {

  /// Formats the date in the format "dd-MMM-yyyy".
  String get formatDate {
    try {
      final format = DateFormat("dd-MMM-yyyy").format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "dd-MMM-yyyy";
    }
  }

  /// Formats the time in the format "HH:MM".
  String get formatTime {
    try {
      final format = DateFormat.jm().format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "HH:MM";
    }
  }

  /// Retrieves the month from the date in the format "MMM".
  String get month {
    try {
      final format = DateFormat("MMM").format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "MMM";
    }
  }

  /// Retrieves the day from the date.
  int get day {
    try {
      final format = DateTime.parse(this);
      return format.day;
    } catch (e) {
      return -1;
    }
  }

  /// Retrieves the day name (weekday) from the date in the format "EEE".
  String get dayName {
    try {
      final format = DateFormat("EEE").format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "Invalid";
    }
  }

  /// Retrieves the year from the date in the format "yyyy".
  String get year {
    try {
      final format = DateFormat("yyyy").format(DateTime.parse(this));
      return format;
    } catch (e) {
      return "yyyy";
    }
  }

  /// Formats the date in the standard format "dd, MMM yyyy".
  String get standardFormat {
    final format = DateFormat("dd, MMM yyyy").format(DateTime.parse(this));
    return format;
  }

  /// Formats the time relative to the current time.
  ///
  /// It returns a string indicating the time difference as "x sec/min/hrs before" from the current time.
  String get standardTime {
    try {
      final sec = DateTime.now().difference(DateTime.parse(this)).inSeconds;
      final min = sec / 60;
      final hour = min / 60;

      if (sec < 60) {
        return "(${sec.toStringAsFixed(1)} sec before)";
      } else if (min < 60 && min > 0) {
        return "(${min.toStringAsFixed(1)} min before)";
      } else {
        return "(${hour.toStringAsFixed(1)} hrs before)";
      }
    } catch (e) {
      return "Invalid";
    }
  }
}
