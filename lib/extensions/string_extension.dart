
extension StringExtension on String{

  String get firstCharToUpper{

    if(length > 1){
      final firstChar = substring(0,1);
      final convertedStr= replaceRange(0, 1, firstChar.toUpperCase());
      return convertedStr;
    }else{
      return toUpperCase();
    }

  }

}